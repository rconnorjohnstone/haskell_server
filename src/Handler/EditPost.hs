{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

module Handler.EditPost where

import Layouts.HomeLayout
import Import
import Yesod.Form.Types ()
import Database.Persist.Sql
import CMarkGFM

uploadDirectory :: FilePath
uploadDirectory = "static/img"

-------------------------------------------------------------------------------

draftForm :: BlogPost -> Html -> MForm Handler (FormResult (Text, FileInfo, UTCTime, Textarea), Widget)
draftForm blogPost = renderDivs $ (,,,) 
    <$> areq textField "Title" (Just (blogPostTitle blogPost))
    <*> fileAFormReq "Cover Image"
    <*> lift (liftIO getCurrentTime)
    <*> areq textareaField "Article" (Just (blogPostArticle blogPost))

-------------------------------------------------------------------------------

getEditPostR :: BlogPostId -> Handler Html
getEditPostR blogPostId = do
  maid <- maybeAuthId
  blogPost <- runDB $ get404 blogPostId
  (blogDraftWidget, enctype) <- generateFormPost (draftForm blogPost)
  homeLayout $ do
    setTitle (toHtml $ blogPostTitle blogPost)
    $(widgetFile "navbar/navbar")
    $(widgetFile "posts/edit")
    $(widgetFile "footer/footer")

-------------------------------------------------------------------------------

postEditPostR :: BlogPostId -> Handler Html
postEditPostR blogPostId = do
  foundBlogPost <- runDB $ get404 blogPostId
  ((res, widget), enctype) <- runFormPost (draftForm foundBlogPost)
  action <- lookupPostParam "action"
  case (res, action) of 
    (FormSuccess (title, image, date, article), Just "delete") -> do
      runDB $ delete blogPostId
      redirect $ AllPostsR
    (FormSuccess (title, image, date, article), Just "publish") -> do
      imageLoc <- writeToServer image
      let blogPost = BlogPost title imageLoc date article
      runDB $ replace blogPostId blogPost
      redirect $ ViewPostR blogPostId
    _ -> redirect $ AllPostsR

writeToServer :: FileInfo -> Handler FilePath
writeToServer file = do
    let filename = unpack $ fileName file
        path = imageFilePath filename
    liftIO $ fileMove file path
    return ("/" Prelude.++ path)

imageFilePath :: String -> FilePath
imageFilePath f = uploadDirectory </> f

{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

module Handler.NewPost where

import Layouts.HomeLayout
import Import 
import Text.Markdown
import Yesod.Text.Markdown

uploadDirectory :: FilePath
uploadDirectory = "static/img"

-------------------------------------------------------------------------------

blogPostForm :: Html -> MForm Handler (FormResult (Text, FileInfo, UTCTime, Markdown), Widget)
blogPostForm = renderDivs $ (,,,)
    <$> areq textField "Title" Nothing
    <*> fileAFormReq "Cover Image"
    <*> lift (liftIO getCurrentTime)
    <*> areq markdownField "Article" Nothing
    
-------------------------------------------------------------------------------

getNewPostR :: Handler Html
getNewPostR = do
  maid <- maybeAuthId
  (blogPostWidget, enctype) <- generateFormPost blogPostForm
  homeLayout $ do
    setTitle "Create a New Blog Post"
    $(widgetFile "navbar/navbar")
    $(widgetFile "posts/new")
    $(widgetFile "footer/footer")

postNewPostR :: Handler Html
postNewPostR = do
  ((res, blogDraftWidget), enctype) <- runFormPost blogPostForm
  case res of 
    FormSuccess (title, image, date, article) -> do
      imageLocation <- writeToServer image
      let blogDraft = BlogDraft title imageLocation date article
      blogDraftId <- runDB $ insert blogDraft
      redirect $ AllPostsR
    _ -> getNewPostR

writeToServer :: FileInfo -> Handler FilePath
writeToServer file = do
    let filename = unpack $ fileName file
        path = imageFilePath filename
    liftIO $ fileMove file path
    return path

imageFilePath :: String -> FilePath
imageFilePath f = uploadDirectory </> f

{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

module Handler.NewPost where

import Layouts.HomeLayout
import Import 
import Yesod.Text.Markdown

-------------------------------------------------------------------------------

blogPostForm :: Html -> MForm Handler (FormResult BlogDraft, Widget)
blogPostForm = renderDivs $ BlogDraft
    <$> areq textField "Title" Nothing
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
    FormSuccess blogDraft -> do
      blogDraftId <- runDB $ insert blogDraft
      redirect $ AllPostsR
    _ -> getNewPostR

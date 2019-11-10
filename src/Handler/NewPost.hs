{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

module Handler.NewPost where

import Layouts.HomeLayout
import Import 
import Yesod.Text.Markdown

-------------------------------------------------------------------------------

blogPostForm :: Html -> MForm Handler (FormResult BlogPost, Widget)
blogPostForm = renderDivs $ BlogPost
    <$> areq textField "Title" Nothing
    <*> areq markdownField "Article" Nothing
    

-------------------------------------------------------------------------------

getNewPostR :: Handler Html
getNewPostR = do
  (blogPostWidget, enctype) <- generateFormPost blogPostForm
  homeLayout $ do
    setTitle "Create a New Blog Post"
    $(widgetFile "navbar/navbar")
    $(widgetFile "posts/new")
    $(widgetFile "footer/footer")

postNewPostR :: Handler Html
postNewPostR = do
  ((res, blogPostWidget), enctype) <- runFormPost blogPostForm
  case res of 
    FormSuccess blogPost -> do
      blogPostId <- runDB $ insert blogPost
      redirect $ ViewPostR blogPostId
    _ -> getNewPostR

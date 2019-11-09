{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

module Handler.ViewPost where

import Layouts.HomeLayout
import Import 
import Yesod.Text.Markdown

-------------------------------------------------------------------------------

getViewPostR :: BlogPostId -> Handler Html
getViewPostR blogPostId = do
  blogPost <-runDB $ get404 blogPostId
  homeLayout $ do
    setTitle (toHtml $ blogPostTitle blogPost)
    $(widgetFile "navbar/navbar")
    $(widgetFile "posts/view")
    $(widgetFile "footer/footer")

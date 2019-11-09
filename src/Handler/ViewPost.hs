{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

module Handler.ViewPost where

import Layouts.HomeLayout
import Import 
import Yesod.Text.Markdown

-------------------------------------------------------------------------------

getViewPostR :: BlogPostId -> Handler Html
getViewPostR blogPostId = do
  homeLayout $ do
    setTitle "Create a New Blog Post"
    $(widgetFile "navbar/navbar")
    $(widgetFile "footer/footer")

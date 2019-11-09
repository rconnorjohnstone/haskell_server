{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

module Handler.NewPost where

import Layouts.HomeLayout
import Import 

-------------------------------------------------------------------------------

getNewPostR :: Handler Html
getNewPostR = homeLayout $ do
    setTitle "Create a New Blog Post"
    $(widgetFile "navbar/navbar")
    $(widgetFile "footer/footer")

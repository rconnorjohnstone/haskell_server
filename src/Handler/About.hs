{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

module Handler.About where

import Import 
import Layouts.HomeLayout

-------------------------------------------------------------------------------

getAboutR :: Handler Html
getAboutR = homeLayout $ do
    setTitle "About Me - Richard Connor Johnstone"
    $(widgetFile "navbar/navbar")
    $(widgetFile "about/about")

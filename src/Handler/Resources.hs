{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

module Handler.Resources where

import Layouts.HomeLayout
import Import 

-------------------------------------------------------------------------------

getResourcesR :: Handler Html
getResourcesR = homeLayout $ do
    setTitle "Resources - Richard Connor Johnstone"
    $(widgetFile "navbar/navbar")
    $(widgetFile "resources/resources")
    $(widgetFile "footer/footer")

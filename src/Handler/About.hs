{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}

module Handler.About where

import Text.Hamlet (hamletFile)
import Import 

homeLayout :: Widget -> Handler Html
homeLayout widget = do
  pc <- widgetToPageContent $ do
    widget
    $(widgetFile "site-layout")
  withUrlRenderer $(hamletFile "templates/site-layout-wrapper.hamlet")


-------------------------------------------------------------------------------

getAboutR :: Handler Html
getAboutR = homeLayout $ do
    setTitle "About Me - Richard Connor Johnstone"
    $(widgetFile "navbar/navbar")

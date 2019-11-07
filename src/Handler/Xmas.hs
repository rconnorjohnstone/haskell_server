{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}

module Handler.Xmas where

import Text.Hamlet (hamletFile)
import Import 

homeLayout :: Widget -> Handler Html
homeLayout widget = do
  pc <- widgetToPageContent $ do
    widget
    $(widgetFile "site-layout")
  withUrlRenderer $(hamletFile "templates/site-layout-wrapper.hamlet")


-------------------------------------------------------------------------------

getXmasR :: Handler Html
getXmasR = homeLayout $ do
    setTitle "Christmas List - Richard Connor Johnstone"
    $(widgetFile "navbar/navbar")
    $(widgetFile "christmas/christmas")

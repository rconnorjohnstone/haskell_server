{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Home where

import Text.Hamlet (hamletFile)
import Import

homeLayout :: Widget -> Handler Html
homeLayout widget = do
  pc <- do
    widgetToPageContent widget
  withUrlRenderer $(hamletFile "templates/site-layout-wrapper.hamlet")


data PreviewCardParams = PreviewCardParams {title :: Text,
                                            text :: Text,
                                            image :: Text} deriving (Show, Read)

aboutMeParams = PreviewCardParams "About Me"  "I am an Aerospace Engineering Master's Student at the University of Colorado - Boulder as well as a Systems Engineer at Palski and Associates. Click the link below to learn a little bit more about my story." "/static/img/about.jpg" 


previewCard :: PreviewCardParams -> Widget
previewCard params = do
  $(widgetFile "preview_card/preview_card")


getHomeR :: Handler Html
getHomeR = do
  homeLayout $ do
    setTitle "Richard Connor Johnstone"
    $(widgetFile "home")
    $(widgetFile "banner/banner")
    previewCard aboutMeParams

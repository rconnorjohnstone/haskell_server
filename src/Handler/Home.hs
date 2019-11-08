{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Home where

import Text.Hamlet (hamletFile)
import Network.HaskellNet.Auth
import Network.HaskellNet.SMTP
import Network.HaskellNet.SMTP.SSL
import Network.Mail.Mime
import Data.Text (append)
import System.Environment
import Import hiding (authenticate)
import Layouts.HomeLayout

data PreviewCardParams = PreviewCardParams {previewTitle :: Text,
                                            previewText :: Text,
                                            previewImage :: Text,
                                            previewOrder :: Int,
                                            previewId :: Text,
                                            previewR :: Text} deriving (Show, Read)

data ProjectCard = ProjectCard {projectTitle :: Text,
                                projectImage :: Text,
                                projectUrl :: Text} deriving (Show, Read)

data Contacter = Contacter {name :: Text,
                            email :: Text,
                            message :: Textarea} deriving (Show, Read)

-------------------------------------------------------------------------------

aboutMeParams :: PreviewCardParams
aboutMeParams = PreviewCardParams "About Me"  "I am an Aerospace Engineering Master's Student at the University of Colorado - Boulder as well as a Systems Engineer at Palski and Associates. Click the link below to learn a little bit more about my story." "/static/img/about.jpg" 0 "about" "/about"

recentParams :: PreviewCardParams
recentParams = PreviewCardParams "Recent Blog Post"  "This will be my most recent blog post" "/static/img/recent.jpg" 2 "recent" "/"

resourceParams :: PreviewCardParams
resourceParams = PreviewCardParams "Resources" "A section for my resume, gallery, CAD examples, and whatever else I feel like uploading." "/static/img/resources.jpg" 0 "resources" "/resources"

-------------------------------------------------------------------------------

imdProject :: ProjectCard
imdProject = ProjectCard "Interplanetary Mission Design Toolbox" "/static/img/imd.jpg"  "https://www.github.com/rconnorjohnstone/IMD_module"

attProject :: ProjectCard
attProject = ProjectCard "Attitude and Kinematics Module" "/static/img/att.jpg"  "https://www.github.com/rconnorjohnstone/Attitude-Control-Module"

wmsProject :: ProjectCard
wmsProject = ProjectCard "Interplanetary Mission Design Toolbox" "/static/img/wms.jpg"  "https://www.github.com/rconnorjohnstone/WheresMySat"

-------------------------------------------------------------------------------

previewCard :: PreviewCardParams -> Widget
previewCard params = $(widgetFile "preview_card/preview_card")

projects :: [ProjectCard] -> Widget
projects cards = $(widgetFile "projects/projects")

-------------------------------------------------------------------------------

contacterForm :: Html -> MForm Handler (FormResult Contacter, Widget)
contacterForm = renderDivs $ Contacter
    <$> areq textField "Name" Nothing
    <*> areq emailField "Email" Nothing
    <*> areq textareaField "Message" Nothing

-------------------------------------------------------------------------------

getHomeR :: Handler Html
getHomeR = do
  (contactWidget, enctype) <- generateFormPost contacterForm
  homeLayout $ do
    setTitle "Richard Connor Johnstone"
    $(widgetFile "banner/banner")
    previewCard aboutMeParams
    previewCard recentParams
    previewCard resourceParams
    projects [imdProject, attProject, wmsProject]
    $(widgetFile "contact/contact")
    $(widgetFile "footer/footer")

postContactR :: Handler Html
postContactR = do
  ((result, contactWidget), enctype) <- runFormPost contacterForm
  case result of
    FormSuccess contacter -> do
      let body = (name contacter) `append` 
                 "\n\n" `append` 
                 (email contacter) `append` 
                 "\n\n" `append` (unTextarea $ message contacter)
      liftIO $ doSMTPSSL "smtp.gmail.com" $ \connection -> do
        robotPass <- getEnv "ROBOT_PASS"
        succeeded <- authenticate LOGIN
                                  "robot@richardconnorjohnstone.com"
                                  robotPass
                                  connection
        when succeeded $
          sendPlainTextMail "connor@richardconnorjohnstone.com" 
                            "robot@richardconnorjohnstone.com" 
                            "New Contact" 
                            (fromStrict body)
                            connection
      redirect HomeR
    _ -> homeLayout
      [whamlet|
        <p>Invalid input, let's try again.
        <form method=post action=@{ContactR} enctype=#{enctype}>
          ^{contactWidget}
          <button>Submit
      |]

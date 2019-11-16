{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

module Handler.PreviewDraft where

import Layouts.HomeLayout
import Import
import Yesod.Text.Markdown
import Data.Time.Format
import Database.Persist.Sql

-------------------------------------------------------------------------------

getPreviewDraftR :: BlogDraftId -> Handler Html
getPreviewDraftR blogDraftId = do
  maid <- maybeAuthId
  blogDraft <- runDB $ get404 blogDraftId
  homeLayout $ do
    setTitle (toHtml $ blogDraftTitle blogDraft)
    $(widgetFile "navbar/navbar")
    $(widgetFile "posts/preview")
    $(widgetFile "footer/footer")

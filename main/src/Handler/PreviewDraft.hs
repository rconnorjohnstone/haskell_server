{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

module Handler.PreviewDraft where

import Layouts.HomeLayout
import Import
import Data.Time.Format
import Database.Persist.Sql
import CMarkGFM
import Text.HTML.SanitizeXSS
import Text.Blaze.Html

-------------------------------------------------------------------------------

getPreviewDraftR :: BlogDraftId -> Handler Html
getPreviewDraftR blogDraftId = do
  maid <- maybeAuthId
  blogDraft <- runDB $ get404 blogDraftId
  homeLayout $ do
    setTitle (toHtml $ blogDraftTitle blogDraft)
    let articleHtml = sanitize $ commonmarkToHtml [] [] (unTextarea $ blogDraftArticle blogDraft)
    $(widgetFile "navbar/navbar")
    $(widgetFile "posts/preview")
    $(widgetFile "footer/footer")

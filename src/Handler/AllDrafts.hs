{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

module Handler.AllDrafts where

import Layouts.HomeLayout
import Import 
import Yesod.Text.Markdown

-------------------------------------------------------------------------------

getAllDraftsR :: Handler Html
getAllDraftsR = do
  maid <- maybeAuthId
  allPosts <- runDB $ selectList [] [Desc BlogDraftId]
  homeLayout $ do
    setTitle "All Posts"
    $(widgetFile "navbar/navbar")
    $(widgetFile "posts/all_drafts")
    $(widgetFile "footer/footer")

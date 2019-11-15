{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

module Handler.Publish where

import Layouts.HomeLayout
import Import 
import Yesod.Text.Markdown

-------------------------------------------------------------------------------

postPublishR :: BlogDraftId -> Handler Html
postPublishR blogDraftId = do
  blogDraft <- runDB $ get404 blogDraftId
  blogDraftId <- runDB $ insert (BlogPost (blogDraftTitle blogDraft) (blogDraftArticle blogDraft))
  redirect $ AllPostsR

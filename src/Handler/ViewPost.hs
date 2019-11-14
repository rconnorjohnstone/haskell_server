{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

module Handler.ViewPost where

import Layouts.HomeLayout
import Import
import Yesod.Text.Markdown
import Database.Persist.Sql

-------------------------------------------------------------------------------

getViewPostR :: BlogPostId -> Handler Html
getViewPostR blogPostId = do
  maid <- maybeAuthId
  recentBlog <- runDB $ selectList [] [Desc BlogPostId, LimitTo 1]
  let Entity recentId _ = Prelude.head recentBlog
  firstBlog <- runDB $ selectList [] [Asc BlogPostId, LimitTo 1]
  let Entity firstId _ = Prelude.head firstBlog
  previousBlog <- runDB $ selectList [BlogPostId <. blogPostId] [Desc BlogPostId, LimitTo 1]
  let Entity previousId _ = case previousBlog of
                    [] -> Prelude.head firstBlog
                    x -> Prelude.head x
  nextBlog <- runDB $ selectList [BlogPostId >. blogPostId] [Asc BlogPostId, LimitTo 1]
  let Entity nextId _ = case nextBlog of
                    [] -> Prelude.head recentBlog
                    x -> Prelude.head x
  blogPost <- runDB $ get404 blogPostId
  homeLayout $ do
    setTitle (toHtml $ blogPostTitle blogPost)
    $(widgetFile "navbar/navbar")
    $(widgetFile "posts/view")
    $(widgetFile "footer/footer")

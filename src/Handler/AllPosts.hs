{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

module Handler.AllPosts where

import Layouts.HomeLayout
import Import 
import Handler.Home
import Database.Persist.Sql

-------------------------------------------------------------------------------

getAllPostsR :: Handler Html
getAllPostsR = do
  maid <- maybeAuthId
  allEntities <- runDB $ selectList [] [Desc BlogPostId]
  let (Entity recentId recentBlog) = Prelude.head allEntities
      allBlogPosts = Prelude.map entityVal allEntities
      allIds = Prelude.map entityKey allEntities
      allRecentParams = Prelude.map (\(a,b) -> recentParams a b) $ Prelude.zip allBlogPosts allIds
  homeLayout $ do
    setTitle "All Posts"
    $(widgetFile "navbar/navbar")
    $(widgetFile "posts/all")
    Prelude.mapM previewCard allRecentParams
    $(widgetFile "footer/footer")

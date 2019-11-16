{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

module Handler.AllPosts where

import Layouts.HomeLayout
import Import 

-------------------------------------------------------------------------------

getAllPostsR :: Handler Html
getAllPostsR = do
  maid <- maybeAuthId
  allPosts <- runDB $ selectList [] [Desc BlogPostId]
  homeLayout $ do
    setTitle "All Posts"
    $(widgetFile "navbar/navbar")
    $(widgetFile "posts/all")
    $(widgetFile "footer/footer")

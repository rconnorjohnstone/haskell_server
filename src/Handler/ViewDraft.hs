{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

module Handler.ViewDraft where

import Layouts.HomeLayout
import Import
import Yesod.Text.Markdown
import Database.Persist.Sql

-------------------------------------------------------------------------------

draftForm :: BlogDraft -> Html -> MForm Handler (FormResult BlogPost, Widget)
draftForm blogDraft = renderDivs $ BlogPost
    <$> areq textField "Title" (Just (blogDraftTitle blogDraft))
    <*> areq markdownField "Article" (Just (blogDraftArticle blogDraft))

-------------------------------------------------------------------------------

getViewDraftR :: BlogDraftId -> Handler Html
getViewDraftR blogDraftId = do
  maid <- maybeAuthId
  blogDraft <- runDB $ get404 blogDraftId
  recentBlog <- runDB $ selectList [] [Desc BlogDraftId, LimitTo 1]
  let Entity recentId _ = Prelude.head recentBlog
  firstBlog <- runDB $ selectList [] [Asc BlogDraftId, LimitTo 1]
  let Entity firstId _ = Prelude.head firstBlog
  previousBlog <- runDB $ selectList [BlogDraftId <. blogDraftId] [Desc BlogDraftId, LimitTo 1]
  let Entity previousId _ = case previousBlog of
                    [] -> Prelude.head firstBlog
                    x -> Prelude.head x
  nextBlog <- runDB $ selectList [BlogDraftId >. blogDraftId] [Asc BlogDraftId, LimitTo 1]
  let Entity nextId _ = case nextBlog of
                    [] -> Prelude.head recentBlog
                    x -> Prelude.head x
  (blogDraftWidget, enctype) <- generateFormPost (draftForm blogDraft)
  homeLayout $ do
    setTitle (toHtml $ blogDraftTitle blogDraft)
    $(widgetFile "navbar/navbar")
    $(widgetFile "posts/view_draft")
    $(widgetFile "footer/footer")

-------------------------------------------------------------------------------

postViewDraftR :: BlogDraftId -> Handler Html
postViewDraftR blogDraftId = do
  foundBlogDraft <- runDB $ get404 blogDraftId
  ((res, widget), enctype) <- runFormPost (draftForm foundBlogDraft)
  action <- lookupPostParam "action"
  case (res, action) of 
    (FormSuccess blogPost, Just "save") -> do
      runDB $ replace blogDraftId $ BlogDraft (blogPostTitle blogPost) (blogPostArticle blogPost)
      redirect $ ViewDraftR blogDraftId
    (FormSuccess blogPost, Just "publish") -> do
      blogPostId <- runDB $ insert blogPost
      redirect $ ViewPostR blogPostId
    _ -> redirect $ AllPostsR


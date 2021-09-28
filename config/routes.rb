Rails.application.routes.draw do
  
  devise_for :users
  root to: "rooms#index"
# トップページにアクセスした時roomsコントローラーのindexアクションのビューが表示される
# ログインしているユーザーが参加しているチャットルーム名とログインしているユーザー名を持っているサイドバーが表示される

  resources :users, only: [:edit, :update]
# ユーザーの情報を編集するページを表示するためにonlyオプションでeditアクションを指定しました
# ユーザーの情報を編集して更新ができるようにonlyオプションでupdateアクションを指定しました

  resources :rooms, only: [:new, :create] do
# チャットルームの新規作成ページとチャットルームが作成できれば良いのでonlyオプションでnewアクションとcreateアクションを指定している
     resources :messages, only: [:index, :create]
  end
# メッセージを投稿するときはどのチャットルームから投稿されたものなのかをパスから判断したいのでroomsコントローラーにmessagesコントローラーをネストさせる必要がある
# 投稿されたメッセージの一覧を確認するためにはどのチャットルームなのか判断できるようにするためにindexアクションを指定している
end

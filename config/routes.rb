Rails.application.routes.draw do
  
  devise_for :users
  root to: "messages#index"
# トップページにアクセスしたときはmessagesコントローラーのindex.html.erbを表示する
# つまりトップページににアクセスしたときは投稿したメッセージが表示されているということ

  resources :users, only: [:edit, :update]
# ユーザーの情報を編集するページを表示するためにonlyオプションでeditアクションを指定しました
# ユーザーの情報を編集して更新ができるようにonlyオプションでupdateアクションを指定しました

  resources :rooms, only: [:new, :create]
# チャットルームの新規作成ページとチャットルームが作成できれば良いのでonlyオプションでnewアクションとcreateアクションを指定している
end

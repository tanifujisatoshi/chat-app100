Rails.application.routes.draw do
  
  devise_for :users
  get 'messages/index'
  root to: "messages#index"
# トップページにアクセスしたときはmessagesコントローラーのindex.html.erbを表示する
# つまりトップページににアクセスしたときは投稿したメッセージが表示されているということ
end

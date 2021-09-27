Rails.application.routes.draw do
  
  get 'messages/index'
  root to: "messages#index"
# トップページにアクセスしたときはmessagesコントローラーのindex.html.erbを表示する
# つまりトップページににアクセスしたときは投稿したメッセージが表示されているということ
end

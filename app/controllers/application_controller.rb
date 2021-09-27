class ApplicationController < ActionController::Base
  before_action :authenticate_user!
# コントローラーのアクションが呼び出された時にログインをしていなければユーザーをログイン画面に遷移させる
# application_controller.rbに記述することで全てのコントローラーに処理を読み込ませることができる

  before_action :configure_permitted_parameters, if: :devise_controller?
# deviseの処理が行われる場合はconfigure_permitted_parametersメソッドが呼び出される

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
# deviseからparamsという名のdevise_parameter_sanitizerがコントローラーに送られてくる
# 新規登録の場合はnameキーのバリューをDBに保存できるようにしている
  end
end

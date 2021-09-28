class UsersController < ApplicationController
  def edit
  end
# views/users/edit.html.erbファイルを閲覧できるようにusersコントローラーにeditアクションを定義しました

  def update
    if current_user.update(user_params)
# ログインしているユーザーの情報をuser_paramsの内容を持って更新している
      redirect_to root_path 
# ログインしているユーザーの情報の更新に成功した場合は更新された情報を持ったトップページが表示される 
    else
      render :edit
# ログインしているユーザーの情報の更新に失敗した場合は入力された情報が残ったままusers/edit.html.erbに遷移させる
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
# 編集ページからusersコントローラーにparamsが送られてくる
# そのハッシュの中にuserというキーがあるのでrequireメソッドを使ってuserキーを取り出している
# nameカラムとemailカラムを保存できるようにしている

end

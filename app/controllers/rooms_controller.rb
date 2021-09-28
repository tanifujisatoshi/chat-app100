class RoomsController < ApplicationController

  def new
    @room = Room.new
  end
# new.html.erbのform_withメソッド内で新規のroomモデルのインスタンスを使用することで入力した内容がroomsコントローラーのcreateアクションに自動的に送信してくれる
end

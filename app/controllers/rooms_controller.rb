class RoomsController < ApplicationController

  def index
  end
  

  def new
    @room = Room.new
  end
# new.html.erbのform_withメソッド内で新規のroomモデルのインスタンスを使用することで入力した内容がroomsコントローラーのcreateアクションに自動的に送信してくれる

  def create
    @room = Room.new(room_params)
# roomモデルの新規インスタンスをroom_paramsの内容を持って生成している
    if @room.save
      redirect_to root_path   
# インスタンスの保存に成功した場合はトップページに遷移させる
    else
      render :new
# インスタンスの保存に失敗した場合は入力した内容が残ったままチャットルーム作成ページに遷移させる
    end
  end

  private
  def room_params
    params.require(:room).permit(:name, user_ids: [])
  end
# チャットルームを作成したときにビューからparams(ハッシュ)が送られてくる
# そのハッシュからまずroomキーを取り出す必要がある nameキーの値の保存を許可している
# user_idsのバリューは配列であるため配列を受け取るために空の配列を用意している
end

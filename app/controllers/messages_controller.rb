class MessagesController < ApplicationController
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
# メッセージを投稿するためにmessageモデルの新規のインスタンスを生成してform_withのmodelオプションで使えるようにした
# チャットルーム名をクリックするとメッセージ一覧(messagesコントローラーのindexアクションのビュー)が確認できる
# そのアクションに遷移するときにmessagesコントローラーのindexアクションにroom_idキーが入ったparamsが届けられる
# そのキーのバリューを取得するとroomsテーブルのレコードが取得できる
# form_withの引数にmessageモデルの新規のインスタンスが入った@messageとルームのidが入った@roomを置くことで自動的に入力した内容がmessagesコントローラーのcreateアクションに送信される
  end

  def create
    @room = Room.find(params[:room_id])
# 投稿フォームからルームのidが送られてくるのでそれを受け取るためにparams[:room_id]としている
# チャットルームのレコードを取得することができる
    @message = @room.messages.new(message_params)
# messages.newと複数形にすることで@roomに紐づいたmessageモデルのインスタンスを生成できる
# messagesコントローラーはroomコントローラーにネストされているのでmessageモデルのインスタンスを生成するときは紐づいているroomモデルのレコードが必要である
    if @message.save
      redirect_to room_messages_path(@room)
# メッセージの保存に成功した場合はメッセージ一覧に遷移させる
    else
      render :index
# 保存に失敗した場合は入力した情報が残ったまま同じ画面に遷移させる
    end
  end

  private

  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end
end

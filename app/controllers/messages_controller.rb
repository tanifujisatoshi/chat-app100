class MessagesController < ApplicationController
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    @messages = @room.messages.includes(:user)
  end
# メッセージを投稿するためにmessageモデルの新規のインスタンスを生成してform_withのmodelオプションで使えるようにした
# チャットルーム名をクリックするとメッセージ一覧(messagesコントローラーのindexアクションのビュー)が確認できる
# そのアクションに遷移するときにmessagesコントローラーのindexアクションにroom_idキーが入ったparamsが届けられる
# そのキーのバリューを取得するとroomsテーブルのレコードが取得できる
# form_withの引数にmessageモデルの新規のインスタンスが入った@messageとルームのidが入った@roomを置くことで自動的に入力した内容がmessagesコントローラーのcreateアクションに送信される
# チャットルームに紐づいたメッセージを全て取得できる メッセージ一覧で投稿者名を表示するためDBへのアクセス回数が増えるのでincludesメソッドの引数にuserモデルを指定している


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
      @messages = @room.messages.includes(:user)
      render :index
# メッセージの保存に失敗した場合は今まで投稿されたメッセージを表示した上でメッセージ一覧に戻すためチャットルームに紐づく今まで投稿されたメッセージを全て取得している
# 入力された内容を残したままメッセージ一覧に遷移させる
# indexアクションで@messages = @room.messages.includes(:user)を定義したのでelseの処理に記述しないとエラーが出る
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end
# paramsで送られてくるcontentキーとimageキーのバリューの保存を許可している
# メッセージを投稿できるのはログインしているユーザーなのでmessagesテーブルの誰が投稿したかを示すuser_idカラムにログインしているユーザーのidを保存している
end

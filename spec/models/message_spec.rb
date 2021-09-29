require 'rails_helper'

RSpec.describe Message, type: :model do
  before do 
    @message = FactoryBot.build(:message)
  end

  describe "メッセージ投稿機能について" do
    context "メッセージが投稿できる場合" do
      it "contentとimageが存在すれば投稿することができる" do
        expect(@message).to be_valid
      end

      it "contentが空でもimageがあれば投稿することができる" do
        @message.content = ""
        expect(@message).to be_valid
      end
# validates :content, presence: true, unless: :was_attached? という記述により画像が添付されていたらcontentが空であるかの検証は行わないことにしている

      it "imageが空でもcontentが存在すれば投稿することができる" do
        @message.image = nil
        expect(@message).to be_valid
      end
# validates :content, presence: true, unless: :was_attached? という記述により画像が添付されていなかったらcontentが空であるかどうかの検証を行う
# 画像が添付されていなくてもcontentのみを投稿することができる
# imageに関しては空文字を代入するのではなく空を意味するnilを入れる
    end

    context "メッセージを投稿することができない場合について" do
      it "contentとimageが空だと投稿することができない" do
        @message.content = ""
        @message.image = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("Content can't be blank")
      end

      it "roomが紐づいていないとメッセージを投稿することができない" do
        @message.room = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("Room must exist")
      end
# メッセージを投稿するときはどのルームで投稿したものなのかが重要になるのでroomが紐ついていないと投稿することができないことを確かめている
      
      it "userが紐づいていないとメッセージを投稿することができない" do
        @message.user = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("User must exist")
      end
# メッセージを投稿するときは誰が投稿したものなのかが重要になるのでuserが紐づいていないと投稿することができないことを確かめている
    end
  end
end

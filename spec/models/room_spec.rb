require 'rails_helper'

RSpec.describe Room, type: :model do
  before do
    @room = FactoryBot.build(:room)
  end

  describe "チャットルーム作成について" do
    context "新規作成できる場合について" do
      it "nameカラムの値が空でなければ新規作成することができる" do
        expect(@room).to be_valid
      end
# 生成されたroomモデルのインスタンスのnameカラムの値が正常なものであることを確かめている
    end


    context "新規作成できない場合について" do
      it "nameカラムが空であると新規作成することができない" do
        @room.name = ""
        @room.valid?
        expect(@room.errors.full_messages).to include("Name can't be blank")
      end
    end
  end
end

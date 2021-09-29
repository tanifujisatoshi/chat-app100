require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
# userモデルのランダムなインスタンスを生成してインスタンス変数@userに代入している

  describe "ユーザー新規登録" do
# どの機能についてテストをしたいかはdescribeメソッドを使う
    context "新規登録できる場合"  do
# describeメソッドで指定した機能ができるかできないかの場合分けをする
      it "nameとemailとpasswordとpassword_confirmationを入力すれば新規登録できる"  do
# itメソッドはdescribeより詳細なできるかできないかの場合分けをする
         expect(@user).to be_valid
# @userが持っているカラムの値が正しいものであることを確認している
      end

      it "passwordが6文字以上だと新規登録ができる" do
        @user.password = "satoshi3104"
        @user.password_confirmation = "satoshi3104"
        expect(@user).to be_valid
      end
# deviseの機能によりpasswordが6文字以上だと登録できるのでそれを確かめている
    end 
    
    
    context "新規登録ができない場合" do
      it "nameカラムが空であると新規登録ができない" do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
# ランダムに生成されたnameカラムの内容を空にしている
# @userに対してバリデーションによるエラーが起きているかを確かめている(falseだとエラーが起きている)
# errorsメソッドを使うことでエラー内容を確認することができる
# さらにfull_messagesメソッドを使うことでエラーメッセージのみを配列で受け取ることができる
# includeマッチャを使ってその配列の中に指定したエラー文が含まれているかを確認している

      

       it "emailカラムが空であると新規登録ができない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
       end

       it "登録するemailが既に存在するものであれば新規登録をすることができない" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
       end
# ユーザーを既に一人DBに登録する必要があるのでランダムに生成された値を持つuserモデルのインスタンスをDBに保存している
# deviseの機能で既にDBに登録されているemailは登録できない仕組みになっているのでそれを確かめるためにuserモデルのインスタンスをもう一つ生成している(emailは先に登録したものと同一である)
# もう一人のユーザーに対してバリデーションによるエラーがあるかを確かめている

       it "passwordが空であると新規登録ができない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
       end

       it "passwordが5文字以下だと新規登録ができない" do
        @user.password = "sa123"
        @user.password_confirmation = "sa123"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
# deviseのpasswordに関するバリデーションの内容は空ではいけない事と5文字以下ではいけない事である
# 5文字以下ではいけないバリデーションが働いているかを確かめている
       end

       it "passwordとpassword_confirmationが一致していないと新規登録ができない" do
        @user.password = "satoshi3104"
        @user.password_confirmation = "satoshi310"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
       end
    end

  end
end

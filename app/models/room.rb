class Room < ApplicationRecord
  has_many :room_users
  has_many :users, through: :room_users
# roomsテーブルと中間テーブルは一対多の関係になるのでhas_manyオプションで中間テーブルを指定している
# usersテーブルは多対多の関係であるためhas_manyオプションでusersテーブルを指定している
# 多対多の関係になったときは間に中間テーブルを置く必要があるのでthroughオプションで中間テーブルを指定している
  has_many :messages
# roomモデルは複数のメッセージを持つことができるのでhas_manyオプションでmessageモデルを指定している
  validates :name, presence: true
# チャットルーム名を空にしたままチャットルームを作成しようとするとエラーが起きる
end

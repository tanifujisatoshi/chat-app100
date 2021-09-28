class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :room_users
  has_many :rooms, through: :room_users
# usersテーブルと中間テーブルは一対多の関係になるのでhas_manyメソッドで中間テーブルを指定している
# 多対多の関係にあるテーブルの間には中間テーブルを置く必要があるのでthroughオプションで中間テーブルを指定している

  has_many :messages
# ユーザーは複数のメッセージを持つことができるのでhas_manyオプションでmessageモデルを指定している

  validates :name, presence: true
# 名前を空にして新規登録やログインが出来ないようにした
# presenceは存在するという意味
end

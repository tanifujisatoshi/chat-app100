class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
# roomモデルは複数のメッセージを持つことができる
# userモデルは複数のメッセージを持つことができる
# それぞれのモデルとmessageモデルは一体多の関係になるのでbelongs_toメソッドを使ってroomモデルとuserモデルの関係を表している

  has_one_attached :image
# messagesテーブルとactive storageのテーブルで管理されている画像ファイルのアソシエーションを記述している(attachは貼り付けるという意味)

  validates :content, presence: true
end





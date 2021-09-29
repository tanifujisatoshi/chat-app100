class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
# roomモデルは複数のメッセージを持つことができる
# userモデルは複数のメッセージを持つことができる
# それぞれのモデルとmessageモデルは一体多の関係になるのでbelongs_toメソッドを使ってroomモデルとuserモデルの関係を表している

  has_one_attached :image
# messagesテーブルとactive storageのテーブルで管理されている画像ファイルのアソシエーションを記述している(attachは貼り付けるという意味)

  validates :content, presence: true, unless: :was_attached?
# unlessオプションをつけることで指定したメソッドの処理がfalseであればcontentカラムが空ではないかを検証する
# 画像が添付されていればメッセージが空でもバリデーションに引っ掛からず画像のみを投稿することができる

  def was_attached?
    self.image.attached?
# 投稿するときに画像が添付されているかを確認している
# 添付されていればtrue されていなければfalseを返す
  end
end





class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
# roomモデルは複数のメッセージを持つことができる
# userモデルは複数のメッセージを持つことができる
# それぞれのモデルとmessageモデルは一体多の関係になるのでbelongs_toメソッドを使ってroomモデルとuserモデルの関係を表している
end

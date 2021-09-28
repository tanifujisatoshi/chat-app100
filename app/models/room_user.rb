class RoomUser < ApplicationRecord
  belongs_to :room
  belongs_to :user
# 参照先のテーブルと中間テーブルは一対多の関係性になるためbelongs_toメソッドを使って参照先テーブルを指定している
end

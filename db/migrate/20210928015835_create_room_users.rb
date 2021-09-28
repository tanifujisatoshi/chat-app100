class CreateRoomUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :room_users do |t|
      t.references :room, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
# roomsテーブルは複数のユーザーを持つことができる usersテーブルは複数のチャットルームを持つことができる
# その二つのテーブルは多対多の関係であるため中間テーブルを作る必要がある
# 中間テーブルにはroomテーブルのidを保存するカラムとusersテーブルのidを保存するカラムが必要である
# それらのカラムは外部のテーブルのカラムを参照しているため型をreferencesにする必要がある
      t.timestamps
    end
  end
end

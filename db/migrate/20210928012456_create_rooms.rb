class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :name, null: false
# チャットルーム名を保存できるようにnameカラムを作成した
# チャットルームを作成するときにnameカラムが空のままでは登録できないようにさせた
      t.timestamps
    end
  end
end

# チャットルームの情報を管理するためのテーブルである

class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
# 投稿したメッセージを管理するためのテーブルを作成しました
      t.string :content
      t.references :room, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
# どのチャットルームで投稿されたメッセージなのか 誰が投稿したメッセージなのかをテーブルに保存する必要があるのでreferences型を用いて外部テーブルのidカラムを参照している
      t.timestamps
    end
  end
end

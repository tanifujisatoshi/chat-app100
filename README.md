# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association
- has_many :room_users
- has_many :rooms, through: :room_users
- has_many :messages
<!-- usersテーブルとroomsテーブルは多対多の関係性にあるので中間テーブルを用意する必要がある -->
<!-- ユーザーは複数のチャットルームに所属することができるのでusersテーブルとroomsテーブルの関係性は多対多であるため中間テーブルを経由して一方のテーブルに行く必要があるためthroughオプションを使って中間テーブルを指定している -->

<!-- encrypted_passwordというカラムはユーザー登録時に入力するpasswordを意味する -->
<!-- encryptedは暗号化されたという意味がある -->
<!-- deviseを用いてユーザー管理機能を実装するときはencrypted_passwordというカラムにpasswordの情報が保存されるためREADMEのusersテーブルのカラム名をencrypted_passwordにしました -->

## rooms テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association
- has_many :room_users
- has_many :users, through: :room_users
- has_many :messages
<!-- roomsテーブルと中間テーブルの関係性は一対多の関係になるのでhas_manyメソッドで中間テーブルを指定している -->
<!-- usersテーブルとは多対多の関係にあるのだが中間テーブルを経由する必要があるのでthroughオプションで中間テーブルを指定している -->

## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association
- belongs_to :room
- belongs_to :user
<!-- 中間テーブルとそれに経由されているテーブルは一対多の関係になるのでbelongs_toメソッドを使って参照先のテーブル名を指定している -->

<!-- references型は他のテーブルから情報を参照する際に使われる型である -->

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association
- belongs_to :room
- belongs_to :user
<!-- チャットルームは複数のメッセージを持つことができる -->
<!-- ユーザーは複数のメッセージを投稿することができる -->

<!-- 記述したREADMEの内容をリモートリポジトリに反映させるためにcommit(テーブル設計というcommit名)とpushを行う -->
<!-- その作業はmasterブランチで行う -->
<!-- 編集したファイル名のコミット名が送信した時のコミットメッセージになっていたらリモートに反映されたことになる -->


FactoryBot.define do
  # FactoryBotを定義するという意味
  factory :user do
    name {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
  end
end
# usersテーブルのname email password password_confirmationカラムの内容をランダムに生成することができる

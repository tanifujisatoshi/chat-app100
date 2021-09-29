FactoryBot.define do
  factory :room do
    name {Faker::Team.name}
  end
# 誰が所属しているのかという情報は中間テーブルが持っているのでこのファイルに association :userの記述は要らない
end

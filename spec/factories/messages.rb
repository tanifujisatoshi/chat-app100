FactoryBot.define do
  factory :message do
    content {Faker::Lorem.sentence}
    association :user
    association :room
# メッセージを投稿するには誰が投稿したのかどのルームで投稿されたのかが重要になるのでassociationの記述をしている
    
    after(:build) do |message|
      message.image.attach(io: File.open("public/images/test_image.png"), filename: "satoshi.png")
    end
# messageモデルのインスタンスが生成された後に画像を添付することができる
# public/images配下にあるtest_image.pngを添付している
# active storageのfilenameカラムにファイル名を保存する必要があるのでそのカラムにpublic/images配下にあるtest_image.pngをtest_image.pngという名前で保存している
  end
end


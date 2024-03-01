require 'faker'
# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
product_names = ["みかん","カフェラテ","置物","船","カメラ","コーラ","フェラーリ","りんご","口紅"]



product_descriptions = [
  "みかんは、甘くてジューシーな果物で、ビタミンCが豊富です。",
  "カフェラテは、エスプレッソとスチームミルクの組み合わせで、豊かなコーヒーの風味を楽しめます。",
  "置物は、美しい彫刻が施された装飾品で、インテリアにアクセントを加えます。",
  "船は、海を航海するための乗り物で、冒険心をくすぐります。",
  "カメラは、写真を撮るためのデバイスで、思い出を永遠に残します。",
  "コーラは、爽やかな炭酸飲料で、炭酸と甘さのバランスが絶妙です。",
  "フェラーリは、スポーツカーの象徴で、スピードとエレガンスを兼ね備えています。",
  "りんごは、みずみずしくて健康的な果物で、栄養価が高く、さまざまな料理に使えます。",
  "口紅は、美しい色合いで唇を彩る化粧品で、魅力的な口元を演出します。"
  ]
9.times do |number|
     product =  Product.create(
      name: product_names[number],
      price: Faker::Number.number(digits: 3),
      product_code: Faker::Code.nric,
      description: product_descriptions[number],
    )
    product.image.attach(io: File.open(Rails.root.join("app/assets/images/image#{number}.jpg")), filename: 'image#{number}.jpg')
end
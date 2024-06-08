FactoryBot.define do
  factory :product do
      id {1}
      name {"モンスター"}
      price { 200 }
      product_code { "product1" }
      description { "夜ふかしの時に飲む" }
      image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/image/adultcat.jpg'))}
      created_at {"2021-07-05 14:31:51 +0900"}
      updated_at {"2021-07-05 14:31:51 +0900"}
      
  end
end

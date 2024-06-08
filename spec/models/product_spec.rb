require 'rails_helper'

RSpec.describe Product, type: :model do
  
  before do 
    @product =  FactoryBot.build(:product)
  end

  describe "商品登録" do

  context '商品登録成功する時' do 
      
      it '商品名は255文字以下である' do 
      @product.name =  "a" * 255
      expect(@product).to be_valid
      end
  end 

context '商品登録失敗する時' do 
  
  it '商品名が空白である' do 
    @product.name = " "
    expect(@product).to be_invalid
  end 

  it '商品名が重複してはいけない'do 
    product = FactoryBot.create(:product, name: "Duplicate Name")
    @product.name = "Duplicate Name"
    @product.valid?
    expect(@product.errors[:name]).to include("はすでに存在します")

  end
end 

end
end 
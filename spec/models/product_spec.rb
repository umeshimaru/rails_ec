require 'rails_helper'

RSpec.describe Product, type: :model do
  

  describe "商品登録" do

  context '商品登録成功する時' do 

  context 'nameカラム' do 
      
      it '商品名は255文字以下だったら登録できる' do 
      product =  FactoryBot.build(:product,name: "a" * 255)
      expect(product).to be_valid
      end



  end


    

end 
end
end 
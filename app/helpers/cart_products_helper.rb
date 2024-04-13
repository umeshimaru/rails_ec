module CartProductsHelper
  def calc_total_quantity(cart_products)
     total_quantity_array = cart_products.map{|cart_product|  cart_product.quantity}
     total_quantity_array.sum
  end 
  
  def calc_total_price(cart_products)
    total_price_array = cart_products.map{|cart_product|  cart_product.product.price * cart_product.quantity}
    total_price_array.sum
  end
end

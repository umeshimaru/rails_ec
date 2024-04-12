module CartProductsHelper
  def calc_total_quantity(cart_prodcuts)
     total_quantity_array = cart_prodcuts.map{|cart_prodcut|  cart_prodcut.quantity}
     total_quantity_array.sum
  end 
  
  def calc_total_price(cart_prodcuts)
    total_price_array = cart_prodcuts.map{|cart_prodcut|  cart_prodcut.product.price}
    total_price_array.sum
  end
end

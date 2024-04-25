# frozen_string_literal: true

module ApplicationHelper
  def hidden_field_tag(_name, _value = nil, _options = {})
    raise 'Happiness chainではhidden_field_tagの使用を禁止しています'
  end

  def admin?
    true if Rails.env.development?
  end

  def admin_products_path_or_products_path?
    admin? ? admin_products_path : products_path
  end

  def calc_total_quantity(cart_products)
    0 if cart_products.empty?
    total_quantity_array = cart_products.map(&:quantity)
    total_quantity_array.sum
  end
end

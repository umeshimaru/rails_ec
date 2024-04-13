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

  

end

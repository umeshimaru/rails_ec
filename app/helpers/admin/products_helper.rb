# frozen_string_literal: true

module Admin
  module ProductsHelper
    def admin?
      true if Rails.env.development?
    end
  end
end

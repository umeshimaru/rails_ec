module Admin::ProductsHelper

  def admin?
    Admin.exists?
  end

end

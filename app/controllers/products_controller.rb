class ProductsController < ApplicationController
  def full_list
    @products = Product.all
    render template: "products/index"
  end

  def just_one
    @product = Product.first
    render template: "products/show"
  end
end

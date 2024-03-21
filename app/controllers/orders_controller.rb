class OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    @orders = current_user.orders
    render :index
  end

  def create
    # Find product from Product model that has an id that matches params[:product_id]
    product = Product.find_by(id: params[:product_id])
    # Get price of that product
    price = product.price
    # Calculate subtotal by multiplying price by params[:quantity]
    calculated_subtotal = price * params[:quantity].to_i
    # Calculate tax using 0.09 or use the product's tax method
    calculated_tax = product.tax * params[:quantity].to_i
    # Calculate the total by adding the subtotal and tax
    calculated_total = calculated_subtotal + calculated_tax

    if current_user
      @order = Order.create(
        user_id: current_user.id,
        product_id: params[:product_id],
        quantity: params[:quantity],
        subtotal: calculated_subtotal,
        tax: calculated_tax,
        total: calculated_total,
      )

      render :show
    else
      render json: [], status: :unauthorized
    end
  end

  def show
    # @order = Order.find_by(id: params[:id], user_id: current_user.id)
    if current_user
      @order = current_user.orders.find_by(id: params[:id])
      render :show
    else
      render json: [], status: :unauthorized
    end
  end
end

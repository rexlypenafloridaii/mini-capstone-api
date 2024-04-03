class OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    @orders = current_user.orders
    render :index
  end

  def create
    @order = Order.create(
      user_id: current_user.id,
    )
    carted_products = current_user.carted_products.where(status: "carted")
    carted_products.each do |carted_product|
      carted_product.update(status: "purchased", order_id: @order.id)
    end
    @order.update_totals
    render :show
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

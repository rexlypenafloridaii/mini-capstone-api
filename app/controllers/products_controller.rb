class ProductsController < ApplicationController
  def index
    @products = Product.all
    render :index
  end

  def create
    @product = Product.create(
      name: "HG RX-78 GP03 Dendrobium",
      price: 300,
      image_url: "https://static.wikia.nocookie.net/gunplabuilders/images/f/f3/HGUC_Dendrobium_boxart.jpg",
      description: "A 1/144 scale of the one of the biggest mobile suits in Mobile Suit Gundam.",
    )
    render :show
  end

  def show
    @product = Product.find_by(id: params["id"])
    render :show
  end
end

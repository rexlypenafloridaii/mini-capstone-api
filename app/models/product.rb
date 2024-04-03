class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, length: { in: 1..500 }

  has_many :category_products
  has_many :categories, through: :category_products
  has_many :carted_products
  has_many :orders, through: :carted_products

  has_many :images
  # def images
  #   Image.where(product_id: id)
  # end

  belongs_to :supplier
  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end

  has_many :orders

  def is_discounted?
    price <= 10
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end

  def primary_image
    if images.length > 0
      images[0].url
    else
      "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg"
    end
  end
end

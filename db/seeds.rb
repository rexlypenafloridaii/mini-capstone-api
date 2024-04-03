# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Supplier.create(name: "Bandai", email: "bandai@example.com", phone_number: "555-555-5555")
Supplier.create(name: "Kotobukiya", email: "koto@example.com", phone_number: "555-555-1234")

Product.create(supplier_id: 1, name: "High Grade RX-79[G] Gundam Ground Type", price: 20, description: "A 1/144 scale model kit of the Gundam Ground Type from Mobile Suit Gundam: The 08th MS Team", inventory: 10)
Product.create(supplier_id: 1, name: "Master Grade RX-78-02 Gundam The Origin", price: 50, description: "A 1/100 scale model kit of the RX-78-02 Gundam mobile suit from Mobile Suit Gundam: The Origin", inventory: 10)
Product.create(supplier_id: 1, name: "Perfect Grade RX-178 Gundam Mk-II Titans", price: 150, description: "A 1/60 scale model kit of the RX-178 Mk-II mobile suit from Mobile Suit Zeta Gundam", inventory: 10)

Image.create(product_id: 1, url: "https://m.media-amazon.com/images/I/713xNo4Tn+L._AC_SL1000_.jpg")
Image.create(product_id: 1, url: "https://static.wikia.nocookie.net/gunplabuilders/images/f/f3/HGUC-Gundam-Ground-Type-box.jpg")
Image.create(product_id: 2, url: "https://cdn.shopify.com/s/files/1/2786/5582/products/mg-rx-78-gundam-gundam-the-origin-ver-pa.jpg")
Image.create(product_id: 3, url: "https://cdn11.bigcommerce.com/s-hfx3ll3t77/images/stencil/1280x1280/products/198/833/5__08812.1595427709.jpg")

Category.create(name: "High Grades")
Category.create(name: "Master Grades")
Category.create(name: "Perfect Grades")

CategoryProduct.create(category_id: 1, product_id: 1)
CategoryProduct.create(category_id: 2, product_id: 2)
CategoryProduct.create(category_id: 3, product_id: 3)

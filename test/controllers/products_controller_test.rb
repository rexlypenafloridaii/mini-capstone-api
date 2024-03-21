require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  setup do
    @user = User.create(name: "Admin", email: "admin@example.com", password: "password", admin: true)
    post "/sessions.json", params: { email: "admin@example.com", password: "password" }
    data = JSON.parse(response.body)
    @jwt = data["jwt"]
  end

  test "index" do
    get "/products.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Product.count, data.length
  end

  test "create" do
    assert_difference "Product.count", 1 do
      post "/products.json",
        headers: { "Authorization" => "Bearer #{@jwt}" },
        params: { supplier_id: Supplier.first.id, name: "test name", price: 1, description: "test description", inventory: 1 }
      data = JSON.parse(response.body)
      assert_response 200
      refute_nil data["id"]
    end

    assert_difference "Product.count", 0 do
      post "/products.json",
        headers: { "Authorization" => "Bearer #{@jwt}" },
        params: {}
      data = JSON.parse(response.body)
      assert_response 422
    end
  end

  test "show" do
    get "/products/#{Product.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "name", "price", "is_discounted?", "tax", "total", "description", "supplier", "images", "primary_image"], data.keys
  end

  test "update" do
    product = Product.first
    patch "/products/#{product.id}.json",
      headers: { "Authorization" => "Bearer #{@jwt}" },
      params: { name: "Updated name" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["name"]

    patch "/products/#{product.id}.json",
      headers: { "Authorization" => "Bearer #{@jwt}" },
      params: { price: -100 }
    assert_response 422
  end

  test "destroy" do
    assert_difference "Product.count", -1 do
      delete "/products/#{Product.first.id}.json", headers: { "Authorization" => "Bearer #{@jwt}" }
      assert_response 200
    end
  end
end

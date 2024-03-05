require "test_helper"

class SuppliersControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "index" do
    get "/suppliers.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Supplier.count, data.length
  end
end

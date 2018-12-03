require 'test_helper'

class PoisControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get pois_show_url
    assert_response :success
  end

  test "should get index" do
    get pois_index_url
    assert_response :success
  end

end

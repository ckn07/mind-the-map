require 'test_helper'

class AnswersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get answers_show_url
    assert_response :success
  end

  test "should get index" do
    get answers_index_url
    assert_response :success
  end

end

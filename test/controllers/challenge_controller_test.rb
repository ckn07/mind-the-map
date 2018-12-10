require 'test_helper'

class ChallengeControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get challenge_new_url
    assert_response :success
  end

  test "should get create" do
    get challenge_create_url
    assert_response :success
  end

end

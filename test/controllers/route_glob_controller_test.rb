require 'test_helper'

class RouteGlobControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get route_glob_index_url
    assert_response :success
  end

end

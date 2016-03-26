require 'test_helper'

class GraphControllerTest < ActionController::TestCase
  test "should get create_graph" do
    get :create_graph
    assert_response :success
  end

end

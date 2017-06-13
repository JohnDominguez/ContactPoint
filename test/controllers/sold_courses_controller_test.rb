require 'test_helper'

class SoldCoursesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sold_courses_index_url
    assert_response :success
  end

end

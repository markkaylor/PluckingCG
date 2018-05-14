require 'test_helper'

class LessonControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get lesson_show_url
    assert_response :success
  end

end

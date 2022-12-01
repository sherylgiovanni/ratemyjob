require "test_helper"

class JobsTest < ActionDispatch::IntegrationTest
  test "jobs index page only shown to logged in users" do
    visit root_path
    click_on "See Jobs"
    
    assert_text "Forbidden"
    assert_equal page.current_path, login_path
   
  end
end

require "test_helper"

class JobsTest < ActionDispatch::IntegrationTest
  test "jobs index page only shown to logged in users" do
    user = login_user
  end
end

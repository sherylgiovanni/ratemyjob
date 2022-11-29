require "test_helper"

class SessionsTest < ActionDispatch::IntegrationTest
  test "users can login" do
    user = FactoryBot.create :user, email: "testlogin@test.com", password: "secret"
    
    visit root_path
    click_on "Login"
    fill_in "Email", with: "testlogin@test.com"
    fill_in "Password", with: "secret"

    click_button "Login"
    
    assert_equal page.current_path, root_path
    
    assert_text "Log out"
    assert_text "Welcome"
    refute page.has_content?("Login")
    
  end
  
  test "users can't login with wrong password" do
    user = FactoryBot.create :user, email: "testlogin@test.com", password: "secret"
    
    visit login_path

    fill_in "Email", with: "testlogin@test.com"
    fill_in "Password", with: "Secret"

    click_button "Login"
  
    assert_text "Invalid"
    refute page.has_content?("Log Out")
  end
  
  test "users can logout" do
    assert true
  end
end

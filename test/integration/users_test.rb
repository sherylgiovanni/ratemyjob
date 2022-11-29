require "test_helper"

class UsersTest < ActionDispatch::IntegrationTest
  test "users can sign up" do
    visit root_path
    click_on "Sign Up"
    fill_in "Name", with: "Test Signup"
    fill_in "Email", with: "signup@test.com"
    fill_in "Password", with: "secret"
    fill_in "Confirm Password", with: "secret"
    click_button "Create Account"
    
    assert_equal page.current_path, root_path
    assert_text "created"
    
    assert_text "Log out"
    assert_text "Test Signup"
    refute page.has_context?("Login")
  end
  
  test "users can not sign up with errors" do
    visit root_path
    click_on "Sign Up"
    fill_in "Name", with: "Test Signup"
    fill_in "Email", with: "signuptest.com" # no @ sign in email
    fill_in "Password", with: "secret"
    fill_in "Confirm Password", with: "secret"
    click_button "Create Account"
    
    assert_text "errors"
  end
end

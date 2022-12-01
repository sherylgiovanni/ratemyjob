require "test_helper"

class ReviewsTest < ActionDispatch::IntegrationTest
  test "show all reviews to logged in users, regardless who created it" do
    user = login_user
    job = FactoryBot.create :job
    review1 = FactoryBot.create :review, job: job, user: user
    review2 = FactoryBot.create :review, job: job, user: user
    review3 = FactoryBot.create :review, job: job
    
    visit root_path
    click_on "See Jobs"
    click_on job.job_title
    click_on "Reviews about this job"
    assert_text review1.pros
    assert_text review2.pros
    assert_text review3.pros
    # click_on "See Jobs"
    # click_on "New Job"
    # fill_in "Job title", with: "Test Job"
    # fill_in "Location", with: "location"
    # fill_in "Category", with: "category"
    # click_button "Submit"
    
    # visit job_path
    # click on "Test Job"
  
    # assert_text "Forbidden"
    # assert_equal page.current_path, login_path
   
  end
end

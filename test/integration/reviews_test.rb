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
  end
  
  test "user can create a review" do
    login_user
    job = FactoryBot.create :job
    visit root_path
    click_on "See Jobs"
    click_on job.job_title
    click_on "Reviews about this job"
    click_on "Add Review"
    fill_in "Work hours", with: "Test hours"
    fill_in "Pros", with: "Test pros"
    fill_in "Cons", with: "Test cons"
    click_button "Submit Review"
    
    assert_text "Test pros"
  end
  
  test "user can edit and delete a review they created" do
    user = login_user
    job = FactoryBot.create :job
    review = FactoryBot.create :review, job: job, user: user
    visit root_path
    click_on "See Jobs"
    click_on job.job_title
    click_on "Reviews about this job"
    click_on review.pros
    assert_text "Edit Review"
    assert_text "Delete Review"
  end
  
  test "user can not edit nor delete a review they did create" do
    login_user
    job = FactoryBot.create :job
    review = FactoryBot.create :review, job: job
    visit root_path
    click_on "See Jobs"
    click_on job.job_title
    click_on "Reviews about this job"
    click_on review.pros
    refute page.has_content?("Edit review")
    refute page.has_content?("Delete review")
  end
  
  
  test "user can delete their review and have it not show up again" do
    user = login_user
    job = FactoryBot.create :job
    review = FactoryBot.create :review, job: job, user: user
    visit root_path
    click_on "See Jobs"
    click_on job.job_title
    click_on "Reviews about this job"
    click_on review.pros
    click_on "Delete Review"
    assert_text "has been deleted"
    refute page.has_content?(review.pros)
  end
end

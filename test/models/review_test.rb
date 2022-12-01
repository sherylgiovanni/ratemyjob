require "test_helper"

class ReviewTest < ActiveSupport::TestCase
  test "has a valid factory" do
    review = FactoryBot.build :review
    assert review.valid?
  end
  
  test "requires a user" do
    review = FactoryBot.build :review
    review.user = nil
    
    refute review.valid?
  end
  
  test "requires a job" do
    review = FactoryBot.build :review
    review.job = nil
    
    refute review.valid?
  end
  
  test "requires pros" do
    review = FactoryBot.build :review
    review.pros = ""
    
    refute review.valid?
  end
  
  test "requires cons" do
    review = FactoryBot.build :review
    review.cons = ""
    
    refute review.valid?
  end
  
  test "requires work hours" do
    review = FactoryBot.build :review
    review.work_hours = ""
    
    refute review.valid?
  end
end

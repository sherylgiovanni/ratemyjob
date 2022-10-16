class ReviewsController < ApplicationController
 before_action :load_job
 def index
 end 

 def new
  @review = Review.new
 end
 
 private
 
 def load_job
  @job = Job.find params[:job_id]
 end
end

class ReviewsController < ApplicationController
 before_action :load_job
 def index
 end 

 def new
  @review = Review.new
 end
 
 def create
  @review = Review.new review_params
  @review.job = @job
  if @job.reviews << @review
   redirect_to job_review_path(@job,@review), notice: "Review added successfully."
  else
   render :new, status: :unprocessable_entity
  end
 end
 
 def show
 
 private
 
 def review_params 
  params.require(:review).permit(:hiring_manager_name, :pros, :cons, :work_hours, :anonymous)
 end
 
 def load_job
  @job = Job.find params[:job_id]
 end
end

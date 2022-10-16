class ReviewsController < ApplicationController
 before_action :load_job
 before_action :load_review, except: [:index, :new, :create]
 
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
 end
 
 def edit
 end
 
 def update
  if @review.update review_params
      redirect_to job_review_path(@job,@review), notice: "Review has been updated."
    else
      render :edit, status: :unprocessable_entity
    end
 end
 
 def destroy
   @review.destroy
   redirect_to job_reviews_path(@job), alert: "Review has been deleted."
 end
 
 private
 
 def review_params 
  params.require(:review).permit(:hiring_manager_name, :pros, :cons, :work_hours, :anonymous)
 end
 
 def load_job
  @job = Job.find params[:job_id]
 end
 
 def load_review
  @review = @job.reviews.find params[:id]
 end
end

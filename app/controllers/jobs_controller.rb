class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end
  
  def new
    @job = Job.new
  end
  
  def create
    @job = Job.new job_params
    if @job.save
      redirect_to jobs_path, notice: "Job added."
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def show 
    load_job
  end
  
  def edit
    load_job
  end
  
  private
  def load_job
    @job = Job.find params[:id]
  end
  
  def job_params
    params.require(:job).permit(:job_title, :location, :category)
  end
end

class JobsController < ApplicationController
  before_action :authenticate
  
  # HTTP method: GET
  # URL: /jobs
  def index
    @jobs = Job.all
  end
  
  # HTTP method: GET
  # URL: /jobs/new
  def new
    @job = Job.new
  end
  
  # HTTP method: POST
  # URL: /jobs
  def create
    @job = Job.new job_params
    if @job.save
      redirect_to jobs_path, notice: "Job added."
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  # HTTP method: GET
  # URL: /jobs/:id
  def show 
    load_job
  end
  
  # HTTP method: GET
  # URL: /jobs/:id/edit
  def edit
    load_job
  end
  
  # HTTP method: PATCH/PUT
  # URL: /jobs/:id
  def update
    load_job
    if @job.update job_params
      redirect_to @job, notice: "Job was updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  # HTTP method: DELETE
  # URL: /jobs/:id
  def destroy
    load_job
    @job.destroy
    redirect_to jobs_path, alert: "Job was deleted."
  end
  
  def search
    if params[:search].blank?
      redirect_to jobs_path
    else
      @parameter = params[:search].downcase
      @results = Jobs.all.where("lower(job_title) LIKE :search", search: "%#{@parameter}%")
  end
  
  private
  def load_job
    @job = Job.find params[:id]
  end
  
  def job_params
    params.require(:job).permit(:job_title, :location, :category)
  end
end

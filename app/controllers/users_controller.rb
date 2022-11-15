class UsersController < ApplicationController
  # authenticate first before everything
  skip_before_action :verify_authenticity_token
  before_action :authenticate, except: [:new, :create]
  
  def new
    if session[:user_hash]
      @user = User.new_from_hash session[:user_hash]
      @user.valid?
    else
      @user = User.new
    end
  end
  
  def create
    if session[:user_hash]
      @user = User.new_from_hash session[:user_hash]
      @user.name = user_params[:name]
      @user.email = user_params[:email]
    else
      @user = User.new user_params
    end
    if @user.save
      # once user is registered, log them in right away
      # refer to the method in application_controller.rb
      login(@user)
      session[:user_hash] = nil
      redirect_to root_path, notice: "Your account has been created."
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def show
    load_user
  end
  
  def edit
    load_user
  end
 
  def update
    load_user
    if @user.update user_params
      
      redirect_to user_path(@user), notice: "Your account has been updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end
 
 def destroy
   load_user
   logout
   @user.destroy
   redirect_to login_path, alert: "You must login to continue."
 end
 
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  def load_user
    @user = User.find params[:id]
  end
end

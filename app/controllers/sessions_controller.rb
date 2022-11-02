class SessionsController < ApplicationController
  def new
  end
  
  def create
    @user = User.where(email: params[:email]).first
    if @user && @user.authenticate(params[:password])
      # refer to the method in application_controller.rb
      login(@user)
      redirect_to root_path, notice: 'Welcome back!'
    else
      redirect_to login_path, alert: 'Invalid email/password.'
    end
  end 
  
  def destroy
    # refer to the method in application_controller.rb
    logout
    redirect_to root_path, notice: 'You have logged out.'
  end
end
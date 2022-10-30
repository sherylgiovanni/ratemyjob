class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new user_params
    if @user.save
      # once user is registered, log them in right away
      # refer to the method in application_controller.rb
      login(@user)
      redirect_to root_path, notice: "Your account has been created."
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end

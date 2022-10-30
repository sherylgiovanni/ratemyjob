class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new user_params
    if @user.save
     redirect_to root_path, notice: "Your account has been created."
    else
     render :new, status: :unprocessable_entity
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end

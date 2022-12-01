class PasswordsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by_email(params[:email])
    user.send_password_reset if user
    redirect_to root_path, :notice => "Email sent with password reset instructions."
  end
  
  def edit
    @user = User.find_by_reset_password_token!(params[:id])
  end
  
  def update
    @user = User.find_by_reset_password_token!(params[:id])
    if @user.reset_password_sent_at < 2.hours.ago
      redirect_to new_password_path, :alert => "Password reset has expired."
    elsif @user.update user_params
      redirect_to root_path, :notice => "Password has been reset!"
    else
      render :edit
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end
  
end


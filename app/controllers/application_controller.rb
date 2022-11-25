class ApplicationController < ActionController::Base
    
  private
  
  def authenticate
    unless current_user
      session[:protected_page] = request.url
      redirect_to login_path, alert: 'Forbidden Access'
    end
  end
  
  def login(user)
    if params[:remember_me]
      cookies.permanent[:auth_token] = user.auth_token
    else
      cookies[:auth_token] = user.auth_token
    end
  end
    
  def logout
    cookies.delete(:auth_token)
  end
  
  def current_user
    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end
  
  helper_method :current_user
  
end

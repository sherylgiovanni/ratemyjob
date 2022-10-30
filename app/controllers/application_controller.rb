class ApplicationController < ActionController::Base
    
  private
  
  def authenticate
    if !current_user
      redirect_to root_path, alert: 'Forbidden Access'
    end
  end
  
  def login(user)
    session[:user_id] = user.id
  end
    
  def logout
    session[:user_id] = nil
  end
  
  def current_user
    if @current_user
      @current_user
    elsif session[:user_id]
      # cache the current user in a variable
      @current_user = User.find session[:user_id]
    end
  end
  
  helper_method :current_user
  
end

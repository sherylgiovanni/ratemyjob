class AuthenticationsController < ApplicationController
  def create
    #render json: auto_hash
  end
  
  private
  def auth_hash
    request.env['omniauth.auth']
  end
  
  def user_hash
    hash = {}
    hash[:uid] = auth_hash['uid']
    if auth_hash['info']
      hash[:name] = auth_hash['info']['name']
      hash[:name] = auth_hash['info']['email']
    end
    if auth_hash['credentials']
      hash[:token] = auth_hash['credentials']['token']
    end
    hash
  end
end
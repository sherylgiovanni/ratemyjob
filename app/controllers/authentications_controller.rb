class AuthenticationsController < ApplicationController
    def create
        render json: auto_hash
    end
    
    private
    def auto_hash
        request.env['omniauth.auth']
    end
    
    def user_hash
    
    end
end
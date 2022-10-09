class SitesController < ApplicationController
  def index
  end
  
  def about
    flash.now[:notice] = "this is a notice"
    flash.now[:alert] = "this is an alert"
  end
end

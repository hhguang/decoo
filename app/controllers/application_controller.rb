class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html {redirect_to root_url, :alert => exception.message}
      format.js { render :template =>'/share/msg',:locals=>{:alert_msg=> exception.message} }

    end
    
  end
end

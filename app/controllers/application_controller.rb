class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  after_filter :log

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html {redirect_to root_url, :alert => exception.message}
      format.js { render :template =>'/share/msg',:locals=>{:alert_msg=> exception.message} }

    end
    
  end

  def log
    if user_signed_in?
      UserLog.create!(:user_id=>current_user.id,:ctr_name=>controller_name,:action_name=>action_name,
        :description=>"#{UserLog::ACTIONS[action_name]}#{controller_name}",
        :url=>request.url,
        :remote_ip=>request.remote_ip
      )
    end
  	
  end
end

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
      res=params[:controller].sub("Controller", "").underscore.split('/').last.singularize
      res_local=I18n.t res.to_sym,:scope => 'activerecord.models', :default => res
      # res_name=res_local.empty? ? res
      UserLog.create!(:user_id=>current_user.id,:ctr_name=>controller_name,:action_name=>action_name,
        :description=>"#{UserLog::ACTIONS[action_name]}#{res_local}",
        :url=>request.url,
        :resource_name=>params[:controller].sub("Controller", "").underscore.split('/').last.singularize,
        :remote_ip=>request.remote_ip
      )
    end
  	
  end
end

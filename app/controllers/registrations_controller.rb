class RegistrationsController < Devise::RegistrationsController
  layout "login"
  def new
     super
  end
end

class ApplicationController < ActionController::Base
  include Devise::Controllers::Helpers
  before_action :configure_permitted_parameters, if: :devise_controller?


  def forbid_guest
    redirect_to "/users/sign_in", :notice => 'You must be signed in to access this page.' unless user_signed_in?
  end
   
  protected

  def configure_permitted_parameters
    attributes = [:username, :email]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end
end

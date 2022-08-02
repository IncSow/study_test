class ApplicationController < ActionController::Base
  include Devise::Controllers::Helpers

  def forbid_guest
      redirect_to "/users/sign_in", :notice => 'You must be signed in to access this page.' unless user_signed_in?
      end
end

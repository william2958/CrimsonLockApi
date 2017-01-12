class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  # Prevent CSRF attacks by using :null_session
  protect_from_forgery with: :null_session
  include DeviseTokenAuth::Concerns::SetUserByToken
  respond_to :json

  # For setting account details upon creation of the account
  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) << :name
  end
end

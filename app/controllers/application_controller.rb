class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
  before_action :permitted_parameters, if: :devise_controller?

  protected
  def permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :photo, :bio])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :photo, :bio])
  end
end

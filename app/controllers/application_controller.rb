class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery prepend: true
  before_action :permitted_parameters, if: :devise_controller?

  def after_sign_out_path_for(*)
    new_user_session_path
  end

  protected

  def permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name photo bio email password])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name photo bio email password])
  end

  def authorize_request
    header = request.headers['Auth']
    header = header.split.last if header
    begin
      @decoded = JWT.decode(header, 'BIG_SECRET')[0]
      @current_user = User.find(@decoded['user_id'])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { error: e.message }, status: :unauthorized
    end
  end
end

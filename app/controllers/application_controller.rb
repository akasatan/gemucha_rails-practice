class ApplicationController < ActionController::Base

#   before_action :authenticate_user!, only: [:top, :index, :show]
  before_action :configure_permitted_parameters, if: :devise_controller?

#   def after_sign_in_path_for(resource)
    # ログイン後に遷移させた所_path
#   end

#   def after_sign_out_path_for(resource)
    # ログアウト後に遷移させたい所_path
#   end
  
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  
protect_from_forgery with: :exception
end

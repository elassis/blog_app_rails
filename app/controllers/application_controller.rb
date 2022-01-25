class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?

  # def after_sign_in_path_for(resource)
  #    redirect_to root_path
  # end
  def after_inactive_sign_up_path_for
    redirect_to root_path
  end

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :photo, :bio, :post_counter, :email, :email_confirmation, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :photo, :bio, :post_counter, :email, :email_confirmation, :password_confirmation,
               :current_password)
    end
  end
end

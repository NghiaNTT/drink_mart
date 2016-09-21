class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up do |u|
      u.permit :name, :email, :password, :password_confirmation,
        :remember_me, :role
    end
    devise_parameter_sanitizer.permit :account_update do |u|
      u.permit :name, :email, :password, :password_confirmation,
        :current_password, :avatar
    end
  end
end

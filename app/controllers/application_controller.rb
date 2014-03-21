class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  
  before_filter :configure_permitted_parameters, if: :devise_controller?
  protected

  def configure_permitted_parameters
    
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit( :password, :password_confirmation,:email,:pseudo,:nom,:prenom,:ddn,:sexe,:avatar) }

    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:password,:current_password,:password_confirmation,:email,:pseudo,:nom,:prenom,:ddn,:sexe,:avatar) }

  end
end

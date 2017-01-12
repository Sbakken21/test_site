class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
 before_action :configure_premitted_parameters, if: :devise_controller?
 
 rescue_from CanCan::AccessDenied do |exception|
     redirect_to root_path
     flash[:danger] = "Sorry you don't have access to this area!"
 end
 
  protected
    def configure_premitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:stripe_card_token, :email, :password, :password_confirmation) }
    end   
end

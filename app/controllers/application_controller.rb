class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
#before_action :configure_devise_permitted_parameters, if: :devise_controller?

def login
 redirect_to albums_path if user_signed_in?
  end
  
  
  protected
#def configure_devise_permitted_parameters
  def configure_permitted_parameters
  registration_params = [:user_name, :email, :password, :password_confirmation]
    devise_parameter_sanitizer.for(:sign_up) << :user_name
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(registration_params) }
  end
  #def sign_in
   # default_params.permit(:username, :email)
 # end
 # protected
 # def devise_parameter_sanitizer
  #  if resource_class == User
    #  User::ParameterSanitizer.new(User, :user, params)
   # else
    #  super # Use the default one
    # end
 # end
end

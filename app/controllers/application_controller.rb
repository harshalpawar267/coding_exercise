class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  
  rescue_from CanCan::AccessDenied do |exception|
    if(request.format.json?)
      render json: {error: "access denied"}, status: :unauthorized# and return
    else
      # flash[:error] = "Access denied!"
      # redirect_to root_path
      redirect_to root_url, :alert => exception.message
    end
  end


  protected

  def configure_permitted_parameters
    added_attrs = [:first_name, :last_name, :phone, :email, :password, :remember_me]
    devise_parameter_sanitizer.permit(:sign_in, keys: added_attrs)
    devise_parameter_sanitizer.permit(:account_update, keys: added_attrs)
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
  end
end

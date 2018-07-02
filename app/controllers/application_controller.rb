class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :configure_sanitized_parameters, if: :devise_controller?
  before_action :set_i18n_locale

protected 

def set_i18n_locale
 I18n.locale = params[:locale] || I18n.default_locale
  end

 def default_url_options(options = {})
    { locale: I18n.locale }
 end



def configure_sanitized_parameters
	devise_parameter_sanitizer.permit(:sign_up) do |user_params|
	  user_params.permit(:name, :email, :password, :password_confirmation, :image, :image_cache)
	end

	devise_parameter_sanitizer.permit(:sign_in) do |user_params|
	  user_params.permit(:name, :email, :password, :password_confirmation, :image, :image_cache)
	end

	devise_parameter_sanitizer.permit(:account_update) do |user_params|
		user_params.permit(:name, :email, :password, :password_confirmation, :current_password, :image)
	end
end

end
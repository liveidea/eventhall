class ApplicationController < ActionController::Base

   require 'carrierwave/orm/activerecord'

  protect_from_forgery with: :exception

   before_action :configure_devise_permitted_parameters, if: :devise_controller?
   before_action :set_locale

  protected

	def configure_devise_permitted_parameters
	  permitted_params = [:email, :password, :password_confirmation, :name, :phone, :last_name, :avatar, :avatar_cache, :remove_avatar]
             devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :password_confirmation, :name, :phone, :last_name, :avatar, :avatar_cache, :remove_avatar])

	  # if params[:action] == 'update'
	  #   devise_parameter_sanitizer.for(:account_update) {
	  #     |u| u.permit(permitted_params << :current_password)
	  #   }
	  # elsif params[:action] == 'create'
	  #   devise_parameter_sanitizer.for(:sign_up) {
	  #     |u| u.permit(permitted_params)
	  #   }
	  # end
	end

  private

	def set_locale
	  I18n.locale = params[:locale] if params[:locale].present?
	end

	def default_url_options(options = {})
	  {locale: I18n.locale}
	end
end

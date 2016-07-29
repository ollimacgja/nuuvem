class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale

  def change_locale
    locale = params[:locale].to_s.strip.to_sym
    locale = I18n.default_locale unless I18n.available_locales.include?(locale)
    cookies.permanent[:locale] = locale
    redirect_to request.referer || root_url
  end

  def set_locale
    if cookies[:locale] && I18n.available_locales.include?(cookies[:locale].to_sym)
      locale = cookies[:locale].to_sym
    else
      locale = I18n.default_locale
      cookies.permanent[:locale] = locale
    end
    I18n.locale = locale
  end
end

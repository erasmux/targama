class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    opt = {}
    opt[:locale] = I18n.locale unless I18n.locale == I18n.default_locale
    opt
  end
end

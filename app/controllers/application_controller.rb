class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :require_login, except: [:not_authenticated]

  protected

  add_flash_types :success, :notice, :alert, :error

  def not_authenticated(message = 'Login requred')
    redirect_to root_path, alert: message
  end
end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

private

  def current_user
    @current_user ||= User.where("auth_token =?", cookies[:auth_token]).first if cookies[:auth_token]
  end

helper_method :current_user


def authenticate
  if not current_user
    session[:previous_url] = request.fullpath
    redirect_to login_path, alert: 'Not signed in!'
  end
end


end

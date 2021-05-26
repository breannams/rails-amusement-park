class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :current_user
  before_action :requires_log_in, except: [:new, :create, :home]

  def logged_in?
    !!current_user
  end

  def current_user
 @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def requires_log_in
    if !logged_in?
      redirect_to root_path
    end
  end
end
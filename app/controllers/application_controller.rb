class ApplicationController < ActionController::Base
  helper_method :current_user
  # before_action :require_user

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    if !current_user
      flash[:alert] = "Please Log in or Create an Account."
      redirect_to root_path
    end
  end
end

class SessionsController < ApplicationController
  before_action :require_user, only: [:destroy]

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.name}!"
      redirect_to dashboard_path
    else
      flash[:error] = "Sorry, your credentials are bad. Please try again."
      render :new
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end
end

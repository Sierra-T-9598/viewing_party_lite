class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    user = user_params
    if user[:password_confirmation] == user[:password]
      new_user = User.create(user)
      validate_email(new_user)
    else
      redirect_to '/register'
      flash[:error] = "This user could not be created. Please check your form."
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def validate_email(new_user)
    if new_user.save
      redirect_to user_path(new_user[:id])
      flash[:alert] = "Welcome to your Viewing Party!"
    else
      redirect_to '/register'
      flash[:error] = "This user could not be created. Please check your form."
    end
  end
end

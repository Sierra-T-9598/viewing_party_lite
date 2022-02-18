class DiscoverController < ApplicationController
  def index
    @user = current_user
    # @user = User.find(params[:user_id])
  end
end

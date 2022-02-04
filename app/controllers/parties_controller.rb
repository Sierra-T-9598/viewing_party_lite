class PartiesController < ApplicationController
  before_action :user
  def new
    @users = User.all

    @movie = MoviesFacade.get_movie(params[:movie_id])
  end

  def create
    @movie = MoviesFacade.get_movie(params[:movie_id])
    @viewing_party = Party.create(party_params)

    if @viewing_party.duration >= @movie.runtime

      @users = User.all.each do |user|
        @viewing_party.users << user
      end
      redirect_to user_path(@user.id)
    else
      redirect_to new_user_movie_party_path(@user.id, @movie.id)
      flash[:error] = "This party is too short!! Loser..."
    end
  end

  def user
    @user = User.find(params[:user_id])
  end

  private
  def party_params
    params.permit(:duration, :date, :time, :movie_id, :host_id)
  end
end

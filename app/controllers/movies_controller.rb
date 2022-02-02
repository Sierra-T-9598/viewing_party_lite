class MoviesController < ApplicationController
  before_action :user

  def index
    if params[:q] == "top_rated"
      @movies = MoviesFacade.get_top_movies
    else params[:q] == "search"
      @movies = MoviesFacade.get_search(params[:q])
    end
  end

  def show
    @movie = MoviesFacade.get_movie(params[:id])
    @movie_cast = MoviesFacade.get_cast(params[:id])
    @movie_reviews = MoviesFacade.get_reviews(params[:id])
  end

  def user
    @user = User.find(params[:user_id])
  end
end

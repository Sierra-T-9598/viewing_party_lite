class MoviesFacade
  class << self
    def get_top_movies
      @movies = MovieService.top_rated_movies
      @movies.map do |movie|
        Movie.new(movie)
      end
    end

    def get_search(keyword)
      @movies = MovieService.movie_search(keyword)
      if @movies == nil
        
      else
        @movies.map do |movie|
          Movie.new(movie)
        end
      end
    end

    def get_movie(id)
      data = MovieService.movie_details(id)
      movie = Movie.new(data)
    end

    def get_cast(id)
      data = MovieService.movie_credits(id)[:cast].map do |cast_member|
        CastMember.new(cast_member)
      end[0..9]
    end

    def get_reviews(id)
      data = MovieService.movie_reviews(id)[:results].map do |review|
        Review.new(review)
      end
    end
  end
end

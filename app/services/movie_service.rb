class MovieService
    def self.top_rated_movies
      first_call = get_data('/3/movie/top_rated?page=1')
      second_call = get_data('/3/movie/top_rated?page=2')
      first_call[:results] + second_call[:results]
    end

    def self.movie_search(keyword)
      response = get_data("/3/search/movie?query=#{keyword}")
      search = response[:results]
    end

    def self.movie_details(id)
      response = get_data("/3/movie/#{id}?")
    end

    def self.movie_credits(id)
      response = get_data("/3/movie/#{id}/credits?")
    end

    def self.movie_reviews(id)
      response = get_data("/3/movie/#{id}/reviews?")
    end

    private
    def self.conn
      Faraday.new(url: "https://api.themoviedb.org") do |faraday|
          faraday.params['api_key'] = ENV['movie_api_key']
        end
    end

    def self.get_data(url)
      response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end
  end

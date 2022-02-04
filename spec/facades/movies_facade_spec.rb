require 'rails_helper'

RSpec.describe MoviesFacade do
  describe '::get_top_movies' do
    it 'returns a list of the top 40 movies' do
      movies = MoviesFacade.get_top_movies

      expect(movies).to be_a Array
      expect(movies.first).to be_a Movie

      movies.each do |movie|
        expect(movie).to be_a Movie
      end
    end

    describe '::get_search(keyword)' do
      it 'returns the movies defined by the keyword search' do
        movies = MoviesFacade.get_search("Fight")
        expect(movies).to be_a Array

        movies.each do |movie|
          expect(movie).to be_a Movie
        end
      end
    end

    describe '::get_movie(id)' do
      it 'retrieves the details of the specified movie id' do
        movie = MoviesFacade.get_movie(550)
        expect(movie).to be_a Movie
      end
    end

    describe '::get_cast(id)' do
      it 'retrieves the first 10 members of the movie cast specified by id' do
        cast = MoviesFacade.get_cast(550)
        expect(cast).to be_a Array

        cast.each do |member|
          expect(member).to be_a CastMember
        end
      end
    end

    describe '::get_review(id)' do
      it 'retrieves all movie reviews for the specified movie id' do
        reviews = MoviesFacade.get_reviews(550)
        expect(reviews).to be_a Array

        reviews.each do |review|
          expect(review).to be_a Review
        end 
      end
    end
  end
end

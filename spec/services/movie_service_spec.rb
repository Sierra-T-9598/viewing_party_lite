require 'rails_helper'

RSpec.describe MovieService do
  context 'class methods' do
    context '.top_rated_movies' do
      it "returns movie data", :vcr do
        response = MovieService.top_rated_movies
        expect(response).to be_a Array

        expect(response.first).to have_key :id
        expect(response.first[:id]).to be_a Integer

        expect(response.first).to have_key :title
        expect(response.first[:title]).to be_a String

        expect(response.first).to have_key :vote_average
        expect(response.first[:vote_average]).to be_a Float
      end
    end

    context '.movie_search' do
      it 'returns search data', :vcr do
        response = MovieService.movie_search('fight')
        expect(response).to be_a Array

        expect(response.first).to have_key :title
        expect(response.first[:title]).to be_a String

        expect(response.first).to have_key :vote_average
        expect(response.first[:vote_average]).to be_a Float
      end
    end
    context '.movie_details' do
      it 'returns search data', :vcr do
        response = MovieService.movie_details(550)
        expect(response).to be_a Hash

        expect(response).to have_key :title
        expect(response[:title]).to be_a String

        expect(response).to have_key :overview
        expect(response[:overview]).to be_a String

        expect(response).to have_key :genres
        expect(response[:genres]).to be_a Array

        expect(response).to have_key :poster_path
        expect(response[:poster_path]).to be_a String
      end
    end
    context '.movie_credits' do
      it 'returns search data', :vcr do
        response = MovieService.movie_credits(550)
        expect(response).to be_a Hash

        expect(response).to have_key :cast
        expect(response[:cast]).to be_a Array

        expect(response[:cast].first).to have_key :name
        expect(response[:cast].first[:name]).to be_a String

        expect(response[:cast].first).to have_key :character
        expect(response[:cast].first[:character]).to be_a String
      end
    end

    context '.movie_reviews' do
      it "finds review data", :vcr do
        response = MovieService.movie_reviews(550)
        expect(response).to be_a Hash

        expect(response[:results].first).to have_key :author
        expect(response[:results].first[:author]).to be_a String

        expect(response[:results].first).to have_key :content
        expect(response[:results].first[:content]).to be_a String
      end
    end
  end
end

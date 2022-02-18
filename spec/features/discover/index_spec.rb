require 'rails_helper'

RSpec.describe 'Discover Movies Page' do
  before(:each) do
      @user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      visit discover_index_path
  end

  describe 'user visits "/users/:id/discover" path, where :id, is the id of a valid user' do
    it 'displays a button to Find Top Rated Movies' do
      VCR.use_cassette('top_rated_movies') do
        expect(page).to have_button("Find Top Rated Movies")

        click_button "Find Top Rated Movies"
        expect(current_path).to eq(movies_path)
        expect(status_code).to eq(200)
      end
    end

    it 'displays a search field and button to search keywords for movie title' do
      VCR.use_cassette('keyword_search_result_fight') do
        expect(page).to have_button('Search Movie By Keyword')

        fill_in :q, with: 'fight'
        click_button 'Search Movie By Keyword'
        expect(current_path).to eq(movies_path)
        expect(status_code).to eq(200)
        expect(page).to have_content('Fight Club')
      end
    end
  end
end

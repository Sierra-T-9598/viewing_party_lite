require 'rails_helper'

RSpec.describe 'Movie results Page' do
  describe 'navigates to movie results page' do
    let(:user) { create :user }

    it 'displays the title and vote average of each movie', :vcr do
      visit user_discover_index_path(user)

      fill_in :q, with: 'fight'
      click_button 'Search Movie By Keyword'

      expect(status_code).to eq(200)
      expect(current_path).to eq(user_movies_path(user))
      expect(page).to have_link("Fight Club")
      expect(page).to have_link("You Can't Fight Christmas")
      expect(page).to have_link("Fight Valley")

      expect(page).to have_button("Discover Movies")
    end

    # ADD SAD PATH?
    # it 'does not show the movie results page', :vcr do
    #   visit user_discover_index_path(user)
    #   click_button 'Search Movie By Keyword'
    #
    #   expect(status_code).to eq(400)
    # end

    # it 'displays button to return to discover page', :vcr do
    #   visit user_movies_path(user)
    #   expect(page).to have_button("Discover Movies")
    # end
  end
end

require 'rails_helper'

RSpec.describe 'Movie results Page' do
  describe 'navigates to movie results page' do
    let(:user) { create :user }

    it 'displays the title and vote average of each movie', :vcr do
      visit discover_index_path

      fill_in :q, with: 'fight'
      click_button 'Search Movie By Keyword'

      expect(status_code).to eq(200)
      expect(current_path).to eq(movies_path)
      expect(page).to have_link("Fight Club")
      expect(page).to have_link("You Can't Fight Christmas")
      expect(page).to have_link("Fight Valley")
    end

    it 'does not show the movie results page', :vcr do
      visit discover_index_path
      click_button 'Search Movie By Keyword'

      expect(page).to_not have_link("Fight Club")
      expect(page).to have_content('Not a valid search')
    end

    it 'displays button to return to discover page' do
      visit movies_path
      expect(page).to have_button("Discover Movies")
    end
  end
end

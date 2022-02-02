require 'rails_helper'

RSpec.describe 'Movie Details Page', type: :feature do
  let(:user) { create :user }

  before(:each) do
    visit user_movie_path(user.id, 550)
  end

  describe 'user visits a specific movie page' do
    it 'displays a button to create a viewing party' do
      expect(page).to have_button("Create Viewing Party")
    end

    it 'displays button to return to Discover Page' do
      expect(page).to have_button("Discover Movies")
    end

    it 'displays the movie details' do
      expect(page).to have_content("Fight Club")
      expect(page).to have_content("Rating: 8.4")
      expect(page).to have_content("Runtime: 139")
      expect(page).to have_content("Genre(s): Drama")
      expect(page).to have_content("Summary: A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground \"fight clubs\" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion.")
      expect(page).to have_content("Brad Pitt as Tyler Durden")
      expect(page).to have_content("Total Reviews: 7")
      expect(page).to have_content("Goddard")
    end
  end
end

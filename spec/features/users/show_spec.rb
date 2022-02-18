require 'rails_helper'

RSpec.describe 'User Dashboard', type: :feature do
  describe 'user visits /users/:id, where :id is valid' do

    before(:each) do
      @user_1 = create(:user)
      @user_2 = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_1)
    end

    it 'displays a title with the users name at the top' do
      visit dashboard_path
      within '#header' do
        expect(page).to have_content("#{@user_1.name}'s Dashboard")
        expect(page).to_not have_content("#{@user_2.name}'s Dashboard")
      end
    end

    it 'has a button to Discover Movies' do
      visit dashboard_path
      expect(page).to have_button("Discover Movies")

      click_button "Discover Movies"
      expect(current_path).to eq(discover_index_path)
    end

    it 'displays a section that lists viewing parties after they are created' do
      visit new_movie_party_path(550)
      
      fill_in :duration, with: 139
      select("2022", from: "_date_1i")
      select("February", from: "_date_2i")
      select("2", from: "_date_3i")
      select("08 PM", from: "_time_4i")
      select("15", from: "_time_5i")

      click_button "Create Party"

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_link("Fight Club", href: movie_path(550))
      expect(page).to have_content("You're the host!")
    end
  end
end

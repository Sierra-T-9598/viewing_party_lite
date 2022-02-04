require 'rails_helper'

RSpec.describe 'User Dashboard', type: :feature do
  describe 'user visits /users/:id, where :id is valid' do
    let!(:user_1) { create :user }
    let!(:user_2) { create :user }

    let!(:viewing_party_1) { Party.create!(duration: 150, time: Time.now, date: Date.today)}

    it 'displays a title with the users name at the top' do
      visit user_path(user_1.id)
      within '#header' do
        expect(page).to have_content("#{user_1.name}'s Dashboard")
        expect(page).to_not have_content("#{user_2.name}'s Dashboard")
      end
    end

    it 'has a button to Discover Movies' do
      visit user_path(user_1.id)
      expect(page).to have_button("Discover Movies")

      click_button "Discover Movies"
      expect(current_path).to eq(user_discover_index_path(user_1.id))
    end

    it 'displays a section that lists viewing parties' do
      visit user_path(user_1.id)
      expect(page).to have_content("Viewing Parties")

      visit new_user_movie_party_path(user_1.id, 550)
      fill_in :duration, with: 139
      select("2022", from: "_date_1i")
      select("February", from: "_date_2i")
      select("2", from: "_date_3i")
      select("08 PM", from: "_time_4i")
      select("15", from: "_time_5i")

      click_button "Create Party"
      expect(current_path).to eq(user_path(user_1.id))
      expect(page).to have_link("Fight Club", href: user_movie_path(user_1.id, 550))
      expect(page).to have_content("You're the host!")
    end
  end
end

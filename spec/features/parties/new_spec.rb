require 'rails_helper'

RSpec.describe "New Party" do

  before(:each) do
    @user_1 = User.create!(name: "Carie Hiller", email: "carie@gmail.com", password: '123')
    @user_2 = User.create!(name: "Barry Hiller", email: "barie@gmail.com", password: '1234')
    @user_3 = User.create!(name: "Carl Hiller", email: "cccarie@gmail.com", password: '12345')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_1)
    visit new_movie_party_path(550)
  end

  describe "user visits movie page and sees a form to create a party" do
    it "displays the movie title" do
      expect(page).to have_content("Fight Club")
    end

    it "has a form to create a new party" do
      fill_in :duration, with: 139
      select("2022", from: "_date_1i")
      select("February", from: "_date_2i")
      select("2", from: "_date_3i")
      select("08 PM", from: "_time_4i")
      select("15", from: "_time_5i")
      page.check(@user_2.name)
      page.check(@user_3.name)
      click_button "Create Party"

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Fight Club")
      expect(page).to have_content("You're the host!")
    end

    it "does not create a party shorter than the run time" do
      fill_in :duration, with: 135
      select("2022", from: "_date_1i")
      select("February", from: "_date_2i")
      select("2", from: "_date_3i")
      select("08 PM", from: "_time_4i")
      select("15", from: "_time_5i")
      page.check(@user_2.name)
      page.check(@user_3.name)
      click_button "Create Party"

      expect(current_path).to eq(new_movie_party_path(550))
      expect(page).to have_content("This party is too short!! Loser...")
    end

    it "redirects to the user dashboard with new event displayed" do
      fill_in :duration, with: 139
      select("2022", from: "_date_1i")
      select("February", from: "_date_2i")
      select("2", from: "_date_3i")
      select("08 PM", from: "_time_4i")
      select("15", from: "_time_5i")
      page.check(@user_2.name)
      page.check(@user_3.name)
      click_button "Create Party"

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("February 02, 2022")
      expect(page).to have_content("8:15 PM")
      expect(page).to have_content("Fight Club")
    end

    it "displays party on the invited users dashboard" do
      fill_in :duration, with: 139
      select("2022", from: "_date_1i")
      select("February", from: "_date_2i")
      select("2", from: "_date_3i")
      select("08 PM", from: "_time_4i")
      select("15", from: "_time_5i")
      page.check(@user_2.name)
      page.check(@user_3.name)
      click_button "Create Party"

      expect(current_path).to eq(dashboard_path)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_2)
      visit dashboard_path

      expect(page).to have_content("February 02, 2022")
      expect(page).to have_content("8:15 PM")
      expect(page).to have_content("Fight Club")
      expect(page).to have_content("You're Invited!")
    end
  end
end

require 'rails_helper'

RSpec.describe "New Party" do
  let(:user_1) { User.create!(name: "Carie Hiller", email: "carie@gmail.com")}
  let(:user_2) { User.create!(name: "Barry Biller", email: "barry@gmail.com")}
  let(:user_3) { User.create!(name: "Carl Hill", email: "carlos@gmail.com")}

  before(:each) do
    visit new_user_movie_party_path(user_1.id, 550)
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
      # check(user_2.id)
      # check(user_3.id)
      click_button "Create Party"
      expect(current_path).to eq(user_path(user_1.id))
      expect(page).to have_content("Fight Club")
    end

    it "does not create a party shorter than the run time" do
      fill_in :duration, with: 135
      select("2022", from: "_date_1i")
      select("February", from: "_date_2i")
      select("2", from: "_date_3i")
      select("08 PM", from: "_time_4i")
      select("15", from: "_time_5i")
      # check(user_2.id)
      # check(user_3.id)
      click_button "Create Party"
      expect(current_path).to eq(new_user_movie_party_path(user_1.id, 550))
      expect(page).to have_content("This party is too short!! Loser...")
    end

    it "redirects to the user dashboard with new event displayed" do
      fill_in :duration, with: 139
      select("2022", from: "_date_1i")
      select("February", from: "_date_2i")
      select("2", from: "_date_3i")
      select("08 PM", from: "_time_4i")
      select("15", from: "_time_5i")
      # check(user_2.id)
      # check(user_3.id)
      click_button "Create Party"
      expect(current_path).to eq(user_path(user_1.id))
      expect(page).to have_content("February 02, 2022")
      expect(page).to have_content("8:15 PM")
      expect(page).to_not have_content("Fight Club")
    end

    xit "displays party on the invited users dashboard" do
    end
  end
end
# When I visit the new viewing party page (/users/:user_id/movies/:movid_id/viewing-party/new,
#   where :user_id is a valid user's id),
# I should see the name of the movie title rendered above a form with the following fields:
#
#  Duration of Party with a default value of movie runtime in minutes; a viewing party
#  should NOT be created if set to a value less than the duration of the movie
#  When: field to select date
#  Start Time: field to select time
#  Checkboxes next to each existing user in the system
#  Button to create a party
# Details When the party is created, the user should be redirected back to the
# dashboard where the new event is shown. The event should also be listed on any
# other user's dashbaords that were also invited to the party.

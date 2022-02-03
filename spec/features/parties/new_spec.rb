require 'rails_helper'

RSpec.describe "New Party" do
  let(:user) { create :user}

  before(:each) do
    visit new_user_movie_party(user.id, 550)
  end
  describe "user visits movie page and sees a form to create a party" do
    it "displays the movie title" do
      expect(page).to have_content("Fight Club")
    end
    it "has a form to create a new party" do
    end
    it "does not creat a party shorter than the run time" do
    end
    it "redirects to the user dashboard with new even displayed" do
    end
    it "displays party on the invited users dashboard" do
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

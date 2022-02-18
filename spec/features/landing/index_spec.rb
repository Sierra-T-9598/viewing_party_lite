require 'rails_helper'

RSpec.describe 'landing page', type: :feature do
  describe 'user visits landing page' do
    before(:each) do
      @user_1 = User.create!(name: "Carie Hiller", email: "carie@gmail.com", password: '123')
      @user_2 = User.create!(name: "Barry Hiller", email: "barie@gmail.com", password: '1234')
      @user_3 = User.create!(name: "Carl Hiller", email: "cccarie@gmail.com", password: '12345')
    end

    it 'displays title of application' do
      visit '/'

      within '#header' do
        expect(page).to have_content('Viewing Party Lite')
      end
    end

    it 'displays button to create a new user' do
      visit '/'
      expect(page).to have_button('Create New User')
    end

    it 'displays link for Log In' do
      visit '/'
      expect(page).to have_link('Log In')

      click_link 'Log In'
      expect(current_path).to eq('/login')
    end

    it 'displays list of Existing Users as links to each user dashboard' do
      visit '/'
      expect(User.count).to eq(3)
      expect(page).to have_link("#{@user_1.name}", href: dashboard_path )
      expect(page).to have_link("#{@user_2.name}", href: dashboard_path )
      expect(page).to have_link("#{@user_3.name}", href: dashboard_path )
    end

    it 'displays link to go back to landing page' do
      visit '/'
      expect(page).to have_link("Landing Page", href: root_path)
    end
  end
end

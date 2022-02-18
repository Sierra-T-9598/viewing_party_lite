require 'rails_helper'

RSpec.describe 'Log Out' do
  before(:each) do
    visit root_path
    @user = create(:user, email: 'valid@email.com', password: '12345')

    click_link 'Log In'
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log In'
  end

  it 'can click on button to log out' do
    expect(page).to_not have_link('Log In')
    visit root_path
    click_link 'Logout'
    visit root_path
    save_and_open_page
    expect(current_path).to eq(root_path)
    expect(page).to have_link('Log In')
  end
end

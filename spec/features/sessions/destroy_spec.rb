require 'rails_helper'

RSpec.describe 'Log Out' do
  it 'can click on button to log out' do
    visit root_path
    user = create(:user, email: 'valid@email.com', password: '12345')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    click_link 'Log In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log In'

    visit root_path
    expect(page).to_not have_link('Log In')
    click_link 'Logout'
    save_and_open_page
    expect(current_path).to eq(root_path)
    expect(page).to have_link('Log In')
  end
end

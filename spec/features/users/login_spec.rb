require 'rails_helper'

RSpec.describe 'Login' do
  it 'can log in with valid email and password' do
    user = create(:user, email: 'valid@email.com', password: '12345')
    visit root_path
    click_link 'Log In'

    expect(current_path).to eq(login_path)

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_on "Log In"
  
    expect(current_path).to eq(user_path(user.id))
    expect(page).to have_content("Welcome, #{user.name}!")
  end

  it 'cannot log in with bad credentials' do
    user =  create(:user, email: 'valid@email.com', password: '12345')

    visit login_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: "bad_password"

    click_on 'Log In'

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Sorry, your credentials are bad. Please try again.")
  end
end

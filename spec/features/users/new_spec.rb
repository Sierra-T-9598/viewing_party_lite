require 'rails_helper'

RSpec.describe "register" do
  before(:each) do
    @user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  it 'registers a new user with name, email, password, and password confirmation' do
    visit '/register'

    expect(page).to have_content("Viewing Party Lite")
    expect(page).to have_content("Register a New User")

    fill_in 'Name', with: "Mallory Vining"
    fill_in 'Email', with: "eurotrashdemon@gmail.com"
    fill_in 'Password', with: 'test123'
    fill_in 'Password confirmation', with: 'test123'

    click_button "Create New User"

    expect(current_path).to eq(dashboard_path)
  end

  it 'only creates new user if passwords match and email is valid' do
    visit '/register'

    expect(page).to have_content("Viewing Party Lite")
    expect(page).to have_content("Register a New User")

    fill_in 'Name', with: "Mallory Vining"
    fill_in 'Email', with: 'woohoo@gmail.com'
    fill_in 'Password', with: 'right'
    fill_in 'Password confirmation', with: 'wrong'

    click_button "Create New User"
    expect(current_path).to eq('/register')
    expect(page).to have_content("This user could not be created. Please check your form.")

    fill_in 'Name', with: "Mallory Vining"
    fill_in 'Email', with: nil
    fill_in 'Password', with: 'right'
    fill_in 'Password confirmation', with: 'right'

    click_button "Create New User"
    expect(current_path).to eq('/register')
    expect(page).to have_content("This user could not be created. Please check your form.")
  end

  it 'only creates a new user if passwords match and the email is unique' do
    user_1 = create(:user, email: 'same@email.com')

    visit '/register'

    expect(page).to have_content("Viewing Party Lite")
    expect(page).to have_content("Register a New User")

    fill_in 'Name', with: "Mallory Vining"
    fill_in 'Email', with: 'same@email.com'
    fill_in 'Password', with: 'right'
    fill_in 'Password confirmation', with: 'right'

    click_button "Create New User"
    expect(current_path).to eq('/register')
    expect(page).to have_content("This user could not be created. Please check your form.")
  end
end

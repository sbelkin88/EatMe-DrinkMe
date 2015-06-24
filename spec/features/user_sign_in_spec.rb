require 'rails_helper'

feature 'User signs in' do

  given!(:user) { User.create(email: 'test1@gmail.com', username: 'asdfasdf', password: 'asdfasdf') }

  scenario 'with valid credentials' do
    visit  new_user_session_path
    fill_in 'Email', with: 'test1@gmail.com'
    fill_in 'Password', with: 'asdfasdf' 
    click_on "Log in"

    expect(page).to have_content('Signed in successfully.')
  end

  scenario 'with invalid email' do
  	visit  new_user_session_path
    fill_in 'Email', with: 'invalid@gmail.com'
    fill_in 'Password', with: 'asdfasdf' 
    click_on "Log in"

    expect(page).to have_content('Invalid email or password.')
  end

  scenario 'with invalid email' do
  	visit  new_user_session_path
    fill_in 'Email', with: 'test1@gmail.com'
    fill_in 'Password', with: '' 
    click_on "Log in"

    expect(page).to have_content('Invalid email or password.')
  end
end


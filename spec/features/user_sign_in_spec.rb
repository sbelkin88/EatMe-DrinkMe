require 'rails_helper'

feature 'User signs in' do

  given!(:user) { FactoryGirl.create(:user) {} }

  scenario 'with valid credentials' do
    visit  new_user_session_path
    fill_in 'Email', with: 'test1@gmail.com'
    fill_in 'Password', with: 'asdfasdf' 
    click_on 'Log In'

    expect(page).to have_content('Signed in successfully.')
  end
end


# feature 'Visitor signs up' do
#   scenario 'with valid email and password' do
#     sign_up_with 'valid@example.com', 'password'

#     expect(page).to have_content('Sign out')
#   end

#   scenario 'with invalid email' do
#     sign_up_with 'invalid_email', 'password'

#     expect(page).to have_content('Sign in')
#   end

#   scenario 'with blank password' do
#     sign_up_with 'valid@example.com', ''

#     expect(page).to have_content('Sign in')
#   end

#   def sign_up_with(email, password)
#     visit sign_up_path
#     fill_in 'Email', with: email
#     fill_in 'Password', with: password
#     click_button 'Sign up'
#   end
# end
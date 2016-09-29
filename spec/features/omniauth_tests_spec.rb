require 'rails_helper'

RSpec.feature "OmniauthTests", js:true, type: :feature do
  context 'Signing up, then signing in with Twitter' do
    Steps 'Go to index page to sign up with Twitter' do
      Given 'I am on the home page and click the Sign In with Twitter link' do
        visit '/'
        click_link 'Sign in with Twitter'
      end
      Then 'I am taken to the Twitter sign in page, and I sign in' do
        fill_in 'Username or email', with: 'fakeurbex'
        fill_in 'Password', with: 'faketwitterpassword'
        click_button 'Sign In'
      end
      Then 'I create a username for my UrbEx' do
        fill_in 'user[username]', with: 'username'
        fill_in 'user[email]', with: 'email@email.com'
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
        fill_in 'user[user_description]', with: 'Hello, this is a test.'
        click_button 'Sign up'
      end
      Then 'I expect to be signed up with my Twitter account' do
        expect(page).to have_content("Welcome! You have signed up successfully.")
        expect(page).to have_content('Welcome username!')
        expect(page).to have_content('Email: email@email.com')
      end
      Then 'I can sign out, then sign back in with my Twitter account' do
        click_link 'Sign out'
        click_link 'Sign in with Twitter'
        expect(page).to have_content('Signed in!')
      end
    end # ends steps
  end # ends context

end # ends rspec

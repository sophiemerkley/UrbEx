require 'rails_helper'

RSpec.feature "AdventurePages", type: :feature do
  context 'I am on the adventures page' do
    Steps 'I can post about a place that went on an exploration' do
      Given 'I am signed up' do
        sign_up('whatever@email.com', 'whatever', 'username')
      end # ends Given
      And 'There are categories created' do
        create_categories('Haunted')
        create_categories('Tunnels')
      end
      Then 'I will click a link to get to the adventure page' do
        click_link 'Adventures'
      end
      Then 'I can create a new adventure by clicking New Adventure' do # end then
        click_link 'New Adventure'
      end # end Then
      Then 'I fill in the information about the place I explored' do
        fill_in 'Name', with: 'Strawberry Hill'
        fill_in 'Address', with: '12345 Strawberry Hill'
        fill_in 'Directions', with: 'Go down yellow brick road, watch out for wicked witch of the west she wants your ruby slippers.'
        fill_in 'Description', with: 'Beautiful hill with strawberries with lots of art and great shadows'
        find_field('adventure[category_id]').find('option[2]').text
      end # ends then
      And 'I will click the button create adventure when I want to submit the post' do
        click_button 'Create Adventure'
      end # ends and
      Then 'The page redirects me to the show page so I can see what I just posted' do
        expect(page).to have_content 'Strawberry Hill'
        expect(page).to have_content '12345 Strawberry Hill'
        expect(page).to have_content 'Go down yellow brick road, watch out for wicked witch of the west she wants your ruby slippers.'
        expect(page).to have_content 'Beautiful hill with strawberries with lots of art and great shadows'
      end # ends then
    end # ends steps
  end # ends context
end # ends rspec

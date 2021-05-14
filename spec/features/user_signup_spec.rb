require 'rails_helper'

RSpec.feature 'user signup process', type: :feature do
  scenario 'user signup' do
    # arrange
    visit '/signup'

    within('form') do
      fill_in 'Name', with: 'John Doe'
      fill_in 'Email', with: 'jdoe@example.com'
      fill_in 'Username', with: 'jdoe'
      # cannot use Password because it appears in Password Confirmation
      fill_in 'user_password', with: 'password'
      fill_in 'Confirm Password', with: 'password'

      # act
      click_button 'Create Account'
    end

    # assert
    expect(page).to have_content 'Thanks for signing up!'
  end
end

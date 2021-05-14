require 'rails_helper'

RSpec.feature 'user sign out process', type: :feature do
  scenario 'user sign out' do
    # arrange
    user = create(:user)

    visit '/signin'

    within('form') do
      fill_in 'Email or Username', with: user.email
      fill_in 'Password', with: user.password

      click_on 'Sign In'
    end

    # act
    click_on 'Sign Out'

    # assert
    expect(page).to have_content "You're now signed out!"
  end
end

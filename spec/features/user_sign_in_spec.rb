require 'rails_helper'

RSpec.feature 'user sign in process', type: :feature do
  scenario 'user sign in' do
    # arrange
    user = create(:user)

    visit '/signin'

    within('form') do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password

      # act
      click_on 'Sign In'
    end

    # assert
    expect(page).to have_content "Welcome back, #{user.name}!"
  end
end

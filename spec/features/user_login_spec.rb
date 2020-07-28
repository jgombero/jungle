require 'rails_helper'

RSpec.feature "User can login", type: :feature, js: true do

  # SETUP
  before :each do
  @user = User.create!(
    first_name: "Josh",
    last_name: "Gomberoff",
    email: "example@sample.com",
    password: "password",
    password_confirmation: "password"
  )
  end

  scenario "They can login if they have an account" do 

    # ACT
    visit '/login'

    within 'form' do
      fill_in id: 'email', with: 'example@sample.com'
      fill_in id: 'password', with: 'password'

      click_button 'Submit'
    end

    # DEBUG
    # save_screenshot
    
    # VERIFY
    expect(page).to have_text 'Logout'
  end
end

require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  before :each do
    @user = User.create(first_name: "Test", last_name: "Tester", email: "test@test.com", password: "password", password_confirmation: "password")
  end

  scenario "User is able to login" do
    # ACT
    visit '/login'
    fill_in 'email', with: 'test@test.com'
    fill_in 'password', with: 'password'
    click_button 'Submit'

    # DEBUG
    # save_and_open_screenshot

    # VERIFY
    expect(page).to have_link 'Logout', href: '/logout'
  end
end

require 'rails_helper'

describe 'user navigation' do
  describe 'creation' do
    it 'can register with full set of user attributes' do
      visit new_user_registration_path

      fill_in 'user[email]', with: "test@test.com"
      fill_in 'user[username]', with: "watcheronthewall"
      fill_in 'user[password]', with: "password"
      fill_in 'user[password_confirmation]', with: "password"
      fill_in 'user[first_name]', with: "Jon"
      fill_in 'user[last_name]', with: "Snow"
      fill_in 'user[address1]', with: "address 1"
      fill_in 'user[address2]', with: "address 2"
      fill_in 'user[city]', with: "my city"
      fill_in 'user[post_code]', with: "post code"
      fill_in 'user[state]', with: "my state"
      fill_in 'user[country]', with: "my country"


      click_on "Sign up"

      expect(page).to have_content("Welcome")
    end
  end
end
require 'rails_helper'

RSpec.describe "New user path" do
  context "visitor" do
    it "creates account" do
      visit new_user_path

      fill_in "user[name]", with: "Arnold"
      fill_in "user[email]", with: "arnold@theterminator.com"
      fill_in "user[password]", with: "password"
      click_on "Create User"

      expect(page).to have_content "Account successfully created!"
      expect(User.count).to eq 1
      expect(current_path).to eq login_path
    end

    it "enters invalid data" do
      visit new_user_path

      click_on "Create User"

      expect(page).to have_content "Name can't be blank"
    end
  end
end
  
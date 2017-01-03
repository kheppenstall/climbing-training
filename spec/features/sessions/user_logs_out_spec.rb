require 'rails_helper'

RSpec.describe "Visit logout path" do
  it "as logged in user" do
    user = logged_in_user

    click_on "Logout"

    expect(page).to have_content "You successfully logged out."
    expect(current_path).to eq login_path
    expect(page).to have_link "Login"
    expect(page).to have_link "Create an Account"
  end
end
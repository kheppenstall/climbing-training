require 'rails_helper'

RSpec.describe "User visits login page" do
  it "enters valid credentials" do
    user = create(:user)

    visit login_path
    fill_in "email", with: user.email
    fill_in "password", with: "password"
    click_on "Login"

    expect(current_path).to eq user_path(user)
    expect(page).to have_content "You successfully logged in."
    expect(page).to have_content "Logged in as #{user.name}"
    expect(page).to have_link "Logout"
  end


  it "enters invalid credentials" do
    user = create(:user)

    click_on "Login"

    expect(page).to have_content "Email or password incorrect."
    expect(page).to_not have_content "Logged in as #{user.name}"
    expect(page).to_not have_link "Logout"
    expect(page)


  end
end
require "rails_helper"


RSpec.feature "Creating reagent" do
  before do
    @john = User.create(email: "john@example.com", password: "password")
    login_as(@john)
  end
  
  scenario "with valid inputs" do
    visit "/"
    
    click_link "Misc Reagents"
    click_link "New Misc Reagents"
    expect(page).to have_link("Back")
    
    fill_in "Kit", with: "Pregnancy"
    fill_in "Lot number", with: "EA1234"
    fill_in "Started On", with: "2016-12-16"
    fill_in "Expiration", with: "2017-12-16"
    fill_in "Test left(open box)", with: 2
    fill_in "Box", with: 2
    click_button "Create Reagent"
    
    expect(page). to have_content("Reagent Saved")
  end
end
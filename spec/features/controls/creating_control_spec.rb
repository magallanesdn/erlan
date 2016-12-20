require "rails_helper"

RSpec.feature "Creating control" do
  before do
    @john = User.create(email: "john@example.com", password: "password")
    login_as(@john)
  end
  
  scenario "with valid inputs" do
    visit "/"
    
    click_link "Controls"
    click_link "New Control"
    expect(page).to have_link("Back")
    
    fill_in "QC name", with: "B29"
    fill_in "Lot number", with: "EA1234"
    fill_in "Started On", with: "2016-12-16"
    click_button "Create Control"
    
    expect(page). to have_content("Control Saved")
    
    @control = Control.last
    expect(current_path).to eq(control_path(@control))
  end
  
end
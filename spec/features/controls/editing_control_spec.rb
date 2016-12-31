require "rails_helper"

RSpec.feature "Editing Control" do
  
  before do
    @john = User.create(email: "john@example.com", password: "password")
    login_as(@john)
    
    @control = Control.create(name: "B29", item: "General Chemistry", lot: "EA1234", start: "2016-12-01", expiration: "2017-12-01" )
  end
  
  scenario "User update control successfully" do
    visit "/"
    
    click_link "Controls"
    click_link "Edit"
    
    fill_in "QC name", with: "B28"
    fill_in "Item", with: "General"
    fill_in "Lot number", with: "EA1235"
    fill_in "Started On", with: "2016-12-17"
    fill_in "Expiration", with: "2017-12-17"
    
    click_button "Update"
    
    expect(page).to have_content("Controls updated")
    expect(page.current_path).to eq(controls_path(@controls))
  end

end

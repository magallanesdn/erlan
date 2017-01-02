require "rails_helper"

RSpec.feature "Editing Misc Reagent" do
   before do
    @john = User.create(email: "john@example.com", password: "password")
    login_as(@john)
    
    @misc_reagent = MiscReagent.create(kit: "B29", lot: "EA1234", start: "2016-12-01", expiration: "2017-12-01", test_left: 10, box: 10 )
  end
  
  scenario "User update control successfully" do
    visit "/"
    
    click_link "Misc Reagents"
    click_link "Edit"
    
    fill_in "Kit", with: "Pregnancy"
    fill_in "Lot number", with: "EA1234"
    fill_in "Started On", with: "2016-12-16"
    fill_in "Expiration", with: "2017-12-16"
    fill_in "Test left(open box)", with: 2
    fill_in "Box", with: 2
    
    click_button "Update"
    
    expect(page).to have_content("Reagents updated")
    expect(page.current_path).to eq(misc_reagents_path(@misc_reagents))
  end
end
require "rails_helper"

RSpec.feature "Editing Chem Reagent" do
   before do
    @john = User.create(email: "john@example.com", password: "password")
    login_as(@john)
    
    @chem_reagent = ChemReagent.create(reagent: "ALT", lot: "EA1234", start: "2016-12-01", expiration: "2017-12-01", flex: 10, box: 10 )
  end
  
  scenario "User update control successfully" do
    visit "/"
    
    click_link "Chem Reagents"
    click_link "Edit"
    
    fill_in "Reagent", with: "ALT"
    fill_in "Lot number", with: "EA1234"
    fill_in "Started On", with: "2016-12-16"
    fill_in "Expiration", with: "2017-12-16"
    fill_in "Flex (open box)", with: 2
    fill_in "Box", with: 2
    
    click_button "Update"
    
    expect(page).to have_content("Reagents updated")
    expect(page.current_path).to eq(chem_reagents_path(@chem_reagents))
  end
end
require "rails_helper"

RSpec.feature "Create Chem Reagent" do
   before do
    @john = User.create(email: "john@example.com", password: "password")
    login_as(@john)
  end
  
  scenario "with valid inputs" do
    visit "/"
    
    click_link "Chem Reagents"
    click_link "New Reagent"
    expect(page).to have_link("Back")
    
    fill_in "Reagent", with: "ALT"
    fill_in "Lot number", with: "EA1234"
    fill_in "Started On", with: "2016-12-16"
    fill_in "Expiration", with: "2017-12-16"
    fill_in "Flex (open box)", with: 2
    fill_in "Box", with: 2
    
    click_button "Create Reagent"
    
    expect(page). to have_content("Reagent Saved")
    
    @chem_reagent = ChemReagent.last
    expect(current_path).to eq(chem_reagent_path(@chem_reagent))
  end
  
  scenario "with invalid inputs" do
    visit "/"
    
    click_link "Chem Reagents"
    click_link "New Reagent"
    expect(page).to have_link("Back")
    
    fill_in "Reagent", with: " "
    fill_in "Lot number", with: " "
    fill_in "Started On", with: " "
    fill_in "Expiration", with: " "
    fill_in "Flex (open box)", with: " "
    fill_in "Box", with: " "
    
    click_button "Create Reagent"
    
    expect(page). to have_content("Reagent failed to saved")
    expect(page). to have_content("Reagent can't be blank")
    expect(page). to have_content("Lot can't be blank")
    expect(page). to have_content("Start can't be blank")
    expect(page). to have_content("Expiration can't be blank")
    expect(page). to have_content("Flex can't be blank")
    expect(page). to have_content("Box can't be blank")
  end
end
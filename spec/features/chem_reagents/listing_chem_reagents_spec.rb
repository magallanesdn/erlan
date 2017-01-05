require 'rails_helper'

RSpec.feature "Listing Chem Reagents" do
  before do
    @john = User.create(email: "john@example.com", password: "password")
    
    @chem_reagent1 = ChemReagent.create(reagent: "ALT", lot: "EA1234", start: "2016-12-01", expiration: "2017-12-01", flex: 10, box: 10 )
    @chem_reagent2 = ChemReagent.create(reagent: "AST", lot: "EA1235", start: "2016-12-02", expiration: "2017-12-02", flex: 10, box: 10 )
  end
  
  scenario "Chem Reagent created with user sign in" do
    login_as(@john)
    
    visit '/'
    click_link "Chem Reagents"
    
    expect(page).to have_content(@chem_reagent1.reagent)
    expect(page).to have_content(@chem_reagent1.lot)
    expect(page).to have_content(@chem_reagent1.start)
    expect(page).to have_content(@chem_reagent1.expiration)
    expect(page).to have_content(@chem_reagent1.flex)
    expect(page).to have_content(@chem_reagent1.box)
    
    expect(page).to have_content(@chem_reagent2.reagent)
    expect(page).to have_content(@chem_reagent2.lot)
    expect(page).to have_content(@chem_reagent2.start)
    expect(page).to have_content(@chem_reagent2.expiration)
    expect(page).to have_content(@chem_reagent2.flex)
    expect(page).to have_content(@chem_reagent2.box)
    
    expect(page).to have_link("New Chem Reagent")
  end
end
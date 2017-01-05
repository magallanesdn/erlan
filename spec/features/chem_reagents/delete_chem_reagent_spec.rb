require "rails_helper"

RSpec.feature "Delete Chem Reagent" do
  before do
    @john = User.create(email: "john@example.com", password: "password")
    login_as(@john)
    
    @chem_reagent = ChemReagent.create(reagent: "ALT", lot: "EA1234", start: "2016-12-01", expiration: "2017-12-01", flex: 10, box: 10 )
  end
  
  scenario "A user delete a chem reagent" do
    visit "/"
    
    click_link "Chem Reagents"
    click_link "Delete"
    
    expect(page).to have_content("Reagent has been deleted")
    expect(current_path).to eq(chem_reagents_path)
  end
end
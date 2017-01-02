require "rails_helper"

RSpec.feature "Delete Misc Reagent" do
  before do
    @john = User.create(email: "john@example.com", password: "password")
    login_as(@john)
    
    @misc_reagent = MiscReagent.create(kit: "B29", lot: "EA1234", start: "2016-12-01", expiration: "2017-12-01", test_left: 10, box: 10 )
  end
  
  scenario "A user delete a misc reagent" do
    visit "/"
    
    click_link "Misc Reagents"
    click_link "Delete"
    
    expect(page).to have_content("Reagent has been deleted")
    expect(current_path).to eq(misc_reagents_path)
  end
  
end
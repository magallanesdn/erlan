require 'rails_helper'

RSpec.feature "Listing Miscellaneous Reagents" do
  before do
    @john = User.create(email: "john@example.com", password: "password")
    
    @misc_reagent1 = MiscReagent.create(kit: "pregnancy",  lot: "EA1234", start: "2016-12-01", expiration: "2017-12-01", test_left: 10, box: 10 )
    @misc_reagent2 = MiscReagent.create(kit: "FLU",  lot: "EA1235", start: "2016-12-02", expiration: "2017-12-02", test_left: 9, box: 9 )
  end
  
  scenario "Misc Reagent created with user sign in" do
    login_as(@john)
    
    visit '/'
    click_link "Misc Reagents"
    
    expect(page).to have_content(@misc_reagent1.kit)
    expect(page).to have_content(@misc_reagent1.lot)
    expect(page).to have_content(@misc_reagent1.start)
    expect(page).to have_content(@misc_reagent1.expiration)
    expect(page).to have_content(@misc_reagent1.test_left)
    expect(page).to have_content(@misc_reagent1.box)
    
    expect(page).to have_content(@misc_reagent2.kit)
    expect(page).to have_content(@misc_reagent2.lot)
    expect(page).to have_content(@misc_reagent2.start)
    expect(page).to have_content(@misc_reagent2.expiration)
    expect(page).to have_content(@misc_reagent2.test_left)
    expect(page).to have_content(@misc_reagent2.box)
    
    expect(page).to have_link("New Misc Reagent")
  end
end
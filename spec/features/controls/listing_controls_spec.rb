require 'rails_helper'

RSpec.feature "Listing controls" do
  before do
    @john = User.create(email: "john@example.com", password: "password")
    
    @control1 = Control.create(name: "B29", lot: "EA1234", start: "2016-12-01", expiration: "2017-12-01" )
    @control2 = Control.create(name: "B30", lot: "EA1235", start: "2016-12-02", expiration: "2017-12-02" )
  end
  
  scenario "Controls created with user sign in" do
    login_as(@john)
    
    visit '/'
    click_link "Controls"
    
    expect(page).to have_content(@control1.name)
    expect(page).to have_content(@control1.lot)
    expect(page).to have_content(@control1.start)
    expect(page).to have_content(@control1.expiration)
    expect(page).to have_content(@control2.name)
    expect(page).to have_content(@control2.lot)
    expect(page).to have_content(@control2.start)
    expect(page).to have_content(@control2.expiration)
    
    expect(page).to have_link("New Control")
  end
  
  scenario "Controls created with user NOT sign in" do
   
    
    visit '/'
    click_link "Controls"
    
    expect(page).to have_content(@control1.name)
    expect(page).to have_content(@control1.lot)
    expect(page).to have_content(@control1.start)
    expect(page).to have_content(@control1.expiration)
    expect(page).to have_content(@control2.name)
    expect(page).to have_content(@control2.lot)
    expect(page).to have_content(@control2.start)
    expect(page).to have_content(@control2.expiration)
    
    expect(page).not_to have_link("New Control")
   
  end
  
  scenario "No Controls" do
    Control.delete_all
    
    visit '/'
    click_link "Controls"
    
    expect(page).not_to have_link("New Control")
    
    within ("h1#no-controls") do
      expect(page).to have_content("No Controls Created")
    end
  end
end
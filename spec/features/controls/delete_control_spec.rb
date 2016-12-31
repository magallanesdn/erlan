require "rails_helper"

RSpec.feature "Deleting Control" do
  before do
    @john = User.create(email: "john@example.com", password: "password")
    login_as(@john)
    
    @control = Control.create(name: "B29", lot: "EA1234", start: "2016-12-01", expiration: "2017-12-01" )
  end
  
  scenario "A user delete a control" do
    visit "/"
    
    click_link "Controls"
    click_link "Delete"
    
    expect(page).to have_content("Control has been deleted")
    expect(current_path).to eq(controls_path)
  end

end
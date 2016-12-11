require "rails_helper"

RSpec.feature "Create Home Page" do
  scenario do
  visit '/'
  
  expect(page).to have_link('Home')
  expect(page).to have_link('Control')
  expect(page).to have_content('Current Controls')
  
  end
end
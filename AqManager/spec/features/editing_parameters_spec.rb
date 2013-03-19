require 'spec_helper'

feature 'Editing Parameters' do
  before do
    FactoryGirl.create :parameter
    visit '/'
    click_link 'calcium'
    click_link 'Edit Parameter'

  end
  scenario('updating a parameter') do
    fill_in "Name", :with => 'Magnesium'
    click_button "Update Parameter"
    page.should have_content("Parameter has been updated")
  end

  scenario('updating a parameter with invalid attributes is bad') do
     fill_in 'Name', :with => ''
    click_button 'Update Parameter'
    page.should have_content("Parameter has not been updated.")
  end
end
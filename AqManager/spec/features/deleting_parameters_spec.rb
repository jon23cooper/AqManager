require 'spec_helper'

feature 'Deleting Parameter' do

  scenario 'delete a parameter' do
    FactoryGirl.create :parameter
    visit '/'
    click_link 'calcium'
    click_link 'Delete Parameter'
    page.should have_content('Parameter has been deleted')

#    visit '/'
#    page. should_not have_content('calcium')

  end
end
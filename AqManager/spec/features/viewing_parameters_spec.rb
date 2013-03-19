require 'spec_helper'
require 'factory_girl_rails'

feature 'Viewing Parameters' do

  scenario 'Listing all projects' do

    parameter=FactoryGirl.create(:parameter)
    visit '/'
    click_link 'calcium'
    page.current_url.should == parameter_url(parameter)
    save_and_open_page
  end
end
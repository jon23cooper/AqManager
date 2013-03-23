require 'spec_helper'

feature 'viewing tickets' do
  before do
    calcium=FactoryGirl.create(:parameter, :name => 'Calcium')
    magnesium=FactoryGirl.create(:parameter, :name => 'Magnesium')
    visit '/'
    click_link 'Calcium'
    FactoryGirl.create(:testresult, :parameter => calcium, :note => 'Calcium just right')
    FactoryGirl.create(:testresult, :parameter => magnesium)
    visit '/'
  end

  scenario 'Viewing testresults for a given parameter' do
    click_link 'Calcium'
    page.should have_content("Calcium")
    page.should have_content("#1")
  end

  end
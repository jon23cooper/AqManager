require 'spec_helper'

feature "Creating Test Result" do
  before do
    FactoryGirl.create :parameter,  :name=> 'calcium'
    visit '/'
    click_link 'calcium'
    click_link 'New Test Result'
  end

  scenario 'create a test result' do

    fill_in 'Value', :with => '0.4'
    select "2010", :from => 'testresult_testresult_date_1i'
    select "February", :from => 'testresult_testresult_date_2i'
    select "23", :from => 'testresult_testresult_date_3i'
    select "19", :from => 'testresult_testresult_date_4i'
    select "17", :from => 'testresult_testresult_date_5i'
    fill_in 'Note', :with => 'The test result is low'
    click_button 'Create Testresult'

    page.should have_content('Test result has been created.')
  end

  scenario 'creating a test result without valid attributes fails' do
    click_button 'Create Testresult'
    page.should have_content('Test result has not been created.')
    page.should have_content("Value can't be blank")


  end

end
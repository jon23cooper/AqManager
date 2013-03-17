require 'spec_helper'

feature 'Creating Parameters' do
	scenario "can create a parameter" do
		visit '/'
		
		click_link 'New Parameter'
		fill_in 'Name', :with => 'Calcium'
		fill_in 'Units', :with => 'ppm'
		fill_in 'High Ocean Level', :with => ''
		fill_in 'Normal Ocean Level', :with => '420'
		fill_in 'Low Ocean Level', :with => ''
		fill_in 'Maximum Tank Level', :with => '450'
		fill_in 'Optimum Tank Level', :with => ''
		fill_in 'Minimum Tank Level', :with =>'390'

		click_button 'Create Parameter'
		
		expect(page).to have_content('Parameter has been created.')
	end
end
		
		
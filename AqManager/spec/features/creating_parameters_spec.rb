require 'spec_helper'

feature 'Creating Parameters' do
	scenario "can create a parameter" do
		visit '/'
		
		click_link 'New Parameter'
		fill_in 'Name', :with => 'Calcium'
		fill_in 'units', :with => 'ppm'
		fill_in 'ocean_high', :with => ''
		fill_in 'ocean_norm', :with => '420'
		fill_in 'ocean_low', :with => ''
		fill_in 'tank_high', :with => '450'
		fill_in 'tank_optimum', :with => ''
		fill_in 'tank_low', :with =>'390'
		click_button 'Create Parameter'
		
		expect(page).to have_content('Parameter has been created.')
	end
end
		
		
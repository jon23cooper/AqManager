require 'spec_helper'

feature 'Creating Parameters' do
	scenario "can create a parameter" do
		visit '/'
		
		click_link 'New Parameter'
		fill_in 'Name', :with => 'Calcium'
		fill_in 'Units', :with => 'ppm'
		#fill_in 'Ocean_High', :with => ''
		fill_in 'Ocean norm', :with => '420'
		save_and_open_page
		fill_in 'Ocean_low', :with => ''
		fill_in 'Tank_high', :with => '450'
		fill_in 'Tank_optimum', :with => ''
		fill_in 'Tank_low', :with =>'390'
		save_and_open_page
		click_button 'Create Parameter'
		
		expect(page).to have_content('Parameter has been created.')
	end
end
		
		
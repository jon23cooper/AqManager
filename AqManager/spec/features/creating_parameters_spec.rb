require 'spec_helper'

feature 'Creating Parameters' do

  before do
    visit '/'
    click_link 'New Parameter'
  end

	scenario "can create a parameter" do

		fill_in 'Name', :with => 'Calcium'
		fill_in 'Units', :with => 'ppm'
		fill_in 'High Ocean Level', :with => ''
		fill_in 'Normal Ocean Level', :with => '420'
		fill_in 'Low Ocean Level', :with => ''
		fill_in 'Maximum Tank Level', :with => '450'
		fill_in 'Optimum Tank Level', :with => ''
		fill_in 'Minimum Tank Level', :with =>'390'

    save_and_open_page

		click_button 'Create Parameter'


		expect(page).to have_content('Parameter has been created.')
    parameter=Parameter.where(name: "Calcium").first

    expect(page.current_url).to eql(parameter_url(parameter))

    title="Calcium - Parameters - AqManager"
    expect(find("title").native.text).to have_content(title)

  end

  scenario 'Can not create a parameter without a name' do

    click_button 'Create Parameter'

    expect(page).to have_content("Parameter has not been created.")
    expect(page).to have_content("Name cannot be blank.")
  end
end
		
		
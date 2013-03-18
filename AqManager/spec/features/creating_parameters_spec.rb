require 'spec_helper'

feature 'Creating Parameters' do

  before do
    visit '/'
    click_link 'New Parameter'
  end

	scenario "can create a parameter" do

		fill_in 'Name', :with => 'Calcium'
		fill_in 'Units', :with => 'ppm'
		fill_in 'High Ocean Level', :with => '10'
		fill_in 'Normal Ocean Level', :with => '420'
		fill_in 'Low Ocean Level', :with => '12'
		fill_in 'Maximum Tank Level', :with => '450'
		fill_in 'Optimum Tank Level', :with => '14'
		fill_in 'Minimum Tank Level', :with =>'390'

		click_button 'Create Parameter'


		expect(page).to have_content('Parameter has been created.')
    parameter=Parameter.where(name: "Calcium").first

    expect(page.current_url).to eql(parameter_url(parameter))

    title="Calcium - Parameters - AqManager"
    expect(find("title").native.text).to have_content(title)

  end

  scenario 'Can not create a parameter without a name' do

    fill_in 'Units', :with => 'ppm'
    fill_in 'High Ocean Level', :with => '10'
    fill_in 'Normal Ocean Level', :with => '420'
    fill_in 'Low Ocean Level', :with => '0.7'
    fill_in 'Maximum Tank Level', :with => '450'
    fill_in 'Optimum Tank Level', :with => '0.3'
    fill_in 'Minimum Tank Level', :with =>'390'
    click_button 'Create Parameter'

    expect(page).to have_content("Parameter has not been created.")
    expect(page).to have_content("Name can't be blank")
  end

  scenario 'Cannot create a parameter without units' do
    fill_in 'Name', :with => 'Calcium'
  #  fill_in 'Units', :with => 'ppm'
    fill_in 'High Ocean Level', :with => ''
    fill_in 'Normal Ocean Level', :with => '420'
    fill_in 'Low Ocean Level', :with => ''
    fill_in 'Maximum Tank Level', :with => '450'
    fill_in 'Optimum Tank Level', :with => ''
    fill_in 'Minimum Tank Level', :with =>'390'

    click_button 'Create Parameter'

    expect(page).to have_content("Parameter has not been created.")
    expect(page).to have_content("Units can't be blank")
  end

  scenario 'All level fields must be numerical' do
    fill_in 'Name', :with => 'Calcium'
    fill_in 'Units', :with => 'ppm'
    fill_in 'High Ocean Level', :with => 'a'
    fill_in 'Normal Ocean Level', :with => 'b'
    fill_in 'Low Ocean Level', :with => 'c'
    fill_in 'Maximum Tank Level', :with => 'd'
    fill_in 'Optimum Tank Level', :with => 'e'
    fill_in 'Minimum Tank Level', :with =>'f'

    click_button 'Create Parameter'

    expect(page).to have_content("Parameter has not been created.")
    expect(page).to have_content("6 errors")
    expect(page).to have_content("Ocean max is not a number")
    expect(page).to have_content("Ocean norm is not a number")
    expect(page).to have_content("Ocean min is not a number")
    expect(page).to have_content("Tank max is not a number")
    expect(page).to have_content("Tank optimum is not a number")
    expect(page).to have_content("Tank min is not a number")
  end

end
		
		
require 'rails_helper'

RSpec.describe 'visitor searches for members of a house' do
  it 'shows house members' do
    visit '/'

    expected_houses = ['Stark', 'Lannister', 'Targaryen', 'Tyrell', 'Greyjoy']
    expect(page).to have_select('house', with_options: expected_houses)

    find('#house').select('Greyjoy')
    click_button 'Get Members'

    # Then my path should be "/search" with "house=greyjoy" in the parameters
    expect(current_path).to eq('/search')

    expect(page).to have_content('7 Members')

    # And I should see a list of the 7 members of House Greyjoy
    expect(page.all('.member-list').count).to eq(7)

    within(page.first('.member-list')) do
      # And I should see a name and id for each member.
      expect(page).to have_css('.member-name')
      expect(page).to have_css('.member-id')
    end
  end
end

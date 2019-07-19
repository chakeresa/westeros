require 'rails_helper'

RSpec.describe 'visitor searches for members of a house' do
  it 'shows house members' do
    VCR.use_cassette('visitor_search_house_members', record: :new_episodes) do
      visit '/'

      expected_houses = ['Stark', 'Lannister', 'Targaryen', 'Tyrell', 'Greyjoy']
      expect(page).to have_select('house', with_options: expected_houses)

      find('#house').select('Greyjoy')
      click_button 'Get Members'

      expect(current_path).to eq('/search')

      within('h1') do
        expect(page).to have_content('House Greyjoy')
      end

      expect(page).to have_content('7 Members')

      expect(page.all('.member-list').count).to eq(7)

      within(page.first('.member-list')) do
        expect(page).to have_css('.member-name')
        expect(page).to have_css('.member-id')
      end
    end
  end
end

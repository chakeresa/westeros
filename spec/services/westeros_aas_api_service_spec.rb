require 'rails_helper'

RSpec.describe WesterosAasApiService do
  before(:each) do 
    @service = WesterosAasApiService.new
  end

  it 'exists' do
    expect(@service).to be_a(WesterosAasApiService)
  end

  it '#members gets data for members of a particular house (given an ID)' do
    VCR.use_cassette('api_service_members', record: :new_episodes) do
      members = @service.members(5)
      
      expect(members.count).to eq(7)
      expect(members.first).to have_key(:name)
      expect(members.first).to have_key(:id)
    end
  end
  
  it '#house_list lists the names (and IDs) of all houses' do
    VCR.use_cassette('api_service_house_list', record: :new_episodes) do
      house_list = @service.house_list
    
      expect(house_list.count).to eq(5)
      expect(house_list.first).to have_key(:name)
      expect(house_list.first).to have_key(:id)
    end
  end
end

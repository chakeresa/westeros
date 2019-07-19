require 'spec_helper'
require './app/services/westeros_aas_api_service'

RSpec.describe WesterosAasApiService do
  it 'exists' do
    service = WesterosAasApiService.new
    
    expect(service).to be_a(WesterosAasApiService)
  end
end

class WelcomeIndexFacade
  def houses
    house_hash = westeros_aas_api_service.house_list
    house_hash.map do |house|
      house[:name]
    end
  end

  private

  def westeros_aas_api_service
    WesterosAasApiService.new
  end
end

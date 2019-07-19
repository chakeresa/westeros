class WelcomeIndexFacade < BaseFacade
  def houses
    house_hash = westeros_aas_api_service.house_list

    house_hash.map do |house|
      [house[:name], house[:id]]
    end
  end
end

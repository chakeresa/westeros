class SearchIndexFacade
  def initialize(house)
    @house = house
  end

  def member_count
    members.count
  end

  def members
    @members ||= westeros_api_service.members(@house)
  end

  private

  def westeros_api_service
    WesterosApiService.new
  end
end

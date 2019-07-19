class SearchIndexFacade
  def initialize(house)
    @house = house
  end

  def member_count
    members.count
  end

  def members
    return @members if @members

    members_ary = westeros_api_service.members(@house)[:data].first[:attributes][:members]
    @members = members_ary.map do |member_data|
      Person.new(member_data)
    end
  end

  private

  def westeros_api_service
    WesterosApiService.new
  end
end

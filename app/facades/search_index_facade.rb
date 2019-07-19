class SearchIndexFacade < BaseFacade
  def initialize(house_id)
    @house_id = house_id
  end

  def house_name
    westeros_aas_api_service.house_name_by_id(@house_id)
  end

  def member_count
    members.count
  end

  def members
    return @members if @members

    members_ary = westeros_aas_api_service.members(@house_id)
    @members = members_ary.map do |member_data|
      Person.new(member_data)
    end
  end
end

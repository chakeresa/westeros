class WesterosAasApiService
  def house_name_by_id(house_id)
    house_list.find do |house|
      house[:id] == house_id.to_i
    end[:name]
  end

  def members(house_id)
    fetch_data("api/v1/house/#{house_id}")
  end

  def house_list
    @house_list ||= fetch_data('api/v1/house/')
  end

  private

  def conn
    @conn ||= Faraday.new(url: 'https://westeros-as-a-service.herokuapp.com') do |f|
      f.adapter Faraday.default_adapter
    end
  end

  def fetch_data(uri_path)
    response = conn.get do |req|
      req.url uri_path
      req.headers['x_api_key'] = ENV['WESTEROS_AAS_API_KEY']
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end

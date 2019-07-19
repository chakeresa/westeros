class WesterosApiService
  def members(house)
    fetch_data("api/v1/house/#{house}")
  end

  private

  def conn
    @conn ||= Faraday.new(url: 'http://westerosapi.herokuapp.com') do |f|
      f.adapter Faraday.default_adapter
    end
  end

  def fetch_data(uri_path)
    response = conn.get do |req|
      req.url uri_path
      req.params['api_key'] = ENV['WESTEROS_API_KEY']
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end

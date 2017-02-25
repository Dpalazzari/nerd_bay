class GiphyService

  def self.get_giphy
    JSON.parse(response.body, symbolize_names: true)[:data]
  end

  def self.response
    conn.get do |req|
      req.params['api_key'] = 'dc6zaTOxFJmzC'
    end
  end

  def self.conn
    Faraday.new(:url => 'http://api.giphy.com/v1/gifs/trending') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

end
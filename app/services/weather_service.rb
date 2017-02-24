class WeatherService

  def self.get_data(city)
    JSON.parse(response(city).body, symbolize_names: true)
  end

  def self.response(city)
    conn.get do |req|
      req.params['q'] = "#{city}"
      req.params['units'] = 'metric'
      req.params['appid'] = ENV['weather_key']
    end
  end

  def self.conn
    Faraday.new(:url => 'http://api.openweathermap.org/data/2.5/weather') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

end
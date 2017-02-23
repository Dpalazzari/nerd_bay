class TwitchService

  def self.find
    connection = Faraday.new('https://api.twitch.tv/kraken/streams') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
    response = connection.get do |req|
      req.params['client_id'] = ENV['twitch_client_id']
    end
    output = JSON.parse(response.body, symbolize_names: true)[:streams]
  end

end
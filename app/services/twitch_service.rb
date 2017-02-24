class TwitchService

  def self.find
    JSON.parse(response.body, symbolize_names: true)[:streams]
  end

  def self.response
    conn.get do |req|
      req.params['client_id'] = ENV['twitch_client_id']
    end
  end

  def self.conn
    Faraday.new(:url => 'https://api.twitch.tv/kraken/streams') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

end
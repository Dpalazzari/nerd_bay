class QuoteService

  def self.of_the_day
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.response
    conn.get do |req|
      req.params['format'] = 'json'
      req.params['method'] = 'getQuote'
      req.params['lang'] = 'en'
    end
  end

  def self.conn
    Faraday.new(:url => 'http://api.forismatic.com/api/1.0/') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

end
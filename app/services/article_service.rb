class ArticleService

  def self.get_articles
    JSON.parse(response.body, symbolize_names: true)[:articles]
  end

  def self.response
    conn.get do |req|
      req.params['source'] = 'ign'
      req.params['sortBy'] = 'top'
      req.params['apiKey'] = ENV['articles_key']
    end
  end

  def self.conn
    Faraday.new(:url => 'https://newsapi.org/v1/articles') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

end
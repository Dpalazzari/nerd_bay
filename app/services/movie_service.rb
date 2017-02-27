class MovieService

  def self.now_playing
    JSON.parse(response_now_playing.body, symbolize_names: true)[:results]
  end

  def self.response_now_playing
    conn.get do |req|
      req.params['api_key'] = ENV['movie_key']
    end
  end

  def self.conn
    Faraday.new(:url => 'https://api.themoviedb.org/3/movie/now_playing') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

end
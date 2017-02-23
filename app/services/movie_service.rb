class MovieService

  def self.now_playing
    JSON.parse(response_now_playing.body, symbolize_names: true)[:results]
  end

  def self.obtain_poster(id)
    JSON.parse(response_image_url(id).body, symbolize_names: true)[:posters].first[:file_path]
  end

  def self.response_image_url(id)
    image_conn(id).get do |req|
      req.params['api_key']  = ENV['movie_key']
    end
  end

  def self.response_now_playing
    conn.get do |req|
      req.params['api_key'] = ENV['movie_key']
    end
  end

  def self.image_conn(id)
    Faraday.new(:url => "https://api.themoviedb.org/3/movie/#{id}/images") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def self.conn
    Faraday.new(:url => 'https://api.themoviedb.org/3/movie/now_playing') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

end
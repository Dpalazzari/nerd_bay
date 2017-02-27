class MovieDatabase

  attr_reader :title, :overview, :release, :image

  def initialize(attributes={})
    @title     = attributes[:title]
    @overview  = format_overview(attributes[:overview])
    @release   = attributes[:release_date]
    @image     = attributes[:poster_path]
  end

  def self.now_playing
    MovieService.now_playing.map do |movie|
      new(movie)
    end
  end

  def format_overview(description)
    return description[0...250] + '...'
  end

end
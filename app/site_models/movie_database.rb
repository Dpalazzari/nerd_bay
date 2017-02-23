class MovieDatabase

  attr_reader :title, :overview, :release, :image

  def initialize(attributes={})
    @title     = attributes[:title]
    @overview  = attributes[:overview]
    @release   = attributes[:release_date]
    @image     = get_image(attributes[:id])
  end

  def self.now_playing
    MovieService.now_playing.map do |movie|
      new(movie)
    end
  end

  def get_image(id)
    MovieService.obtain_poster(id)
  end

end
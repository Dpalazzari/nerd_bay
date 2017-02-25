class Giphy

  attr_reader :url

  def initialize(attributes={})
    @url = attributes[:image_url]
  end

  def self.trending
    gif = GiphyService.get_giphy
    new(gif)
  end

end
class Giphy

  attr_reader :url

  def initialize(attributes={})
    @url = attributes[:url]
  end

  def self.trending
    GiphyService.get_giphy.map do |gif|
      new(gif)
    end
  end

end
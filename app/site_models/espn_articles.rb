class EspnArticles

  attr_reader :title, :url

  def initialize(attributes={})
    @title = attributes[:title]
    @url   = attributes[:url]
  end

  def self.top_articles
    SportService.get_articles.map do |article|
      new(article)
    end
  end

end
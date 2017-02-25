class HackerArticles

  attr_reader :title, :url

  def initialize(attributes={})
    @title = attributes[:title]
    @url   = attributes[:url]
  end

  def self.top_articles
    HackerService.get_articles.map do |article|
      new(article)
    end
  end

end
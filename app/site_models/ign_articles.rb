class IgnArticles

  attr_reader :title, :url

  def initialize(attributes={})
    @title = attributes[:title]
    @url   = attributes[:url]
  end

  def self.newest
    ArticleService.get_articles.map do |article|
      new(article)
    end
  end

end
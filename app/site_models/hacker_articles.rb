class HackerArticles

  def self.top_articles
    HackerService.get_articles.map do |article|
      new(article)
    end
  end

end
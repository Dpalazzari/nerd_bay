require 'rails_helper'

describe ArticleService do
  context '.get_articles' do
    it 'returns the top ign articles' do
      VCR.use_cassette("article_service.get_articles") do
        raw_articles = ArticleService.get_articles
        
        expect(raw_articles).to be_an(Array)

        article = raw_articles.first

        expect(article).to be_a(Hash)
        expect(article).to have_key (:title)
        expect(article).to have_key (:url)
      end
    end
  end
end
require 'rails_helper'

describe HackerService do
  context '.get_articles' do
    it 'returns top hacker articles' do
      VCR.use_cassette('hacker_service.get_articles') do
        raw_articles = HackerService.get_articles
        
        expect(raw_articles).to be_an(Array)

        article = raw_articles.first

        expect(article).to have_key(:title)
        expect(article).to have_key(:url)
      end
    end
  end
end
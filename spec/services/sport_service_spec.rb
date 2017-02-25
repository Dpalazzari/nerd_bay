require 'rails_helper'

describe SportService do
  context '.get_articles' do
    it 'returns top articles from espn' do
      VCR.use_cassette('sport_service.get_articles') do
        raw_articles = SportService.get_articles

        expect(raw_articles).to be_an(Array)

        article = raw_articles.first

        expect(article).to have_key(:title)
        expect(article).to have_key(:url)
      end
    end
  end
end
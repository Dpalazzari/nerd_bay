require 'rails_helper'

describe HackerArticles do
  let(:attributes){
    {:title=>"Play Dead, or Specifically, Play Death, in Flipping Death - IGN Video",
      :url=>"http://www.hacker-news.com/videos/2017/03/01/play-dead-or-specifically-play-death-in-flipping-death"}
  }

  context 'attributes' do
    it 'returns hacker articles' do
      expect(attributes[:title]).to be_a(String)
      expect(attributes[:url]).to be_a(String)
    end
  end

  context '.top_articles' do
    before do
      VCR.insert_cassette 'hacker_articles.top_articles', record: :new_episodes
    end

    after do
      VCR.eject_cassette
    end

    it 'returns top hacker articles' do
      articles = HackerArticles.top_articles
      expect(articles).to be_an(Array)

      art = articles.first
      expect(art).to be_a(HackerArticles)
      expect(art.title).to be_a(String)
      expect(art.url).to be_a(String)
    end
  end
end
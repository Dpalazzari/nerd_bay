require 'rails_helper'

describe EspnArticles do
  let(:attributes){
     {:title=>"sporty sporty sports sports",
      :url=>"|sports-stuff.espn.com/cool_article"}
    }

  context 'attributes' do
    it 'returns espn articles' do
      expect(attributes[:title]).to be_a(String)
      expect(attributes[:url]).to be_a(String)
    end
  end

  context '.top_articles' do
    before do
      VCR.insert_cassette 'espn_articles.top_articles', record: :new_episodes
    end

    after do
      VCR.eject_cassette
    end

    it 'returns top espn articles' do
      articles = EspnArticles.top_articles
      expect(articles).to be_an(Array)

      art = articles.first
      expect(art).to be_a(EspnArticles)
      expect(art.title).to be_a(String)
      expect(art.url).to be_a(String)
    end
  end
end
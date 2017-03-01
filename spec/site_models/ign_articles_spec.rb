require 'rails_helper'

describe IgnArticles do
  let(:attributes){
     {:title=>"Play Dead, or Specifically, Play Death, in Flipping Death - IGN Video",
      :url=>"http://www.ign.com/videos/2017/03/01/play-dead-or-specifically-play-death-in-flipping-death"}
    }

  context 'attributes' do
    it 'returns ign articles' do
      expect(attributes[:title]).to be_a(String)
      expect(attributes[:url]).to be_a(String)
    end
  end

  context '.newest' do
    before do
      VCR.insert_cassette 'ign_articles.newest', record: :new_episodes
    end

    after do
      VCR.eject_cassette
    end

    it 'returns top ign articles' do
      articles = IgnArticles.newest
      expect(articles).to be_an(Array)

      art = articles.first
      expect(art).to be_a(IgnArticles)
      expect(art.title).to be_a(String)
      expect(art.url).to be_a(String)
    end
  end
end
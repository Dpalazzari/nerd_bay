require 'rails_helper'

describe RedditThreads do
  let(:attributes){
    {
      :title=>"Update is live! • r/Overwatch",
      :url=>"https://www.reddit.com/r/Overwatch/comments/5wpteb/update_is_live/"
    }
  }
  let(:threads){ RedditThreads.new(attributes) }

  context 'attributes' do
    it 'returns values' do
      expect(attributes[:title]).to be_a(String)
      expect(attributes[:url]).to be_a(String)
    end
  end

  context '.top_threads' do
    before do
      VCR.insert_cassette 'reddit_threads.top_threads', record: :new_episodes
    end
    after do
      VCR.eject_cassette
    end

    it  'returns most popular threads' do
      threads = RedditThreads.top_threads

      expect(threads).to be_an(Array)

      thread = threads.first
      expect(thread).to be_a(RedditThreads)
      expect(thread.title).to be_a(String)
      expect(thread.url).to be_a(String)
    end
  end
end
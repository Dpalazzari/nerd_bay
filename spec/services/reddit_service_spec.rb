require 'rails_helper'

describe RedditService do
  context '.get_threads' do
    it 'returns the top  threads from reddit' do
      VCR.use_cassette('reddit_service.get_threads') do
        raw_threads = RedditService.get_threads

        expect(raw_threads).to be_an(Array)

        thread = raw_threads.first

        expect(thread).to have_key(:title)
        expect(thread).to have_key(:url)
      end
    end
  end
end
require 'rails_helper'

describe TwitchService do
  context '.find' do
    it 'returns top streams from Twitch' do
      VCR.use_cassette("twitch_service.find") do
        raw_streams = TwitchService.find

        expect(raw_streams).to be_an(Array)
        expect(raw_streams.count).to eq(25)

        stream = raw_streams.first
        
        expect(stream).to be_a(Hash)
        expect(stream).to have_key(:game)
        expect(stream).to have_key(:channel)
        expect(stream[:game]).to be_a(String)
        expect(stream[:channel]).to have_key(:name)
        expect(stream[:channel]).to have_key(:logo)
        expect(stream[:channel]).to have_key(:url)
        expect(stream[:channel]).to have_key(:views)
        expect(stream[:channel]).to have_key(:followers)
      end
    end
  end
end
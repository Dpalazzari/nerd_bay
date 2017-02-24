require 'rails_helper'

describe Twitch do
  let(:attributes){
    {
      :game=>"Counter-Strike: Global Offensive",
      :channel=>
        {
         :name=>"summit1g",
         :logo=>"https://static-cdn.jtvnw.net/jtv_user_pictures/summit1g-profile_image-87970af8826df799-300x300.png",
         :url=>"https://www.twitch.tv/summit1g",
         :views=>119134535,
         :followers=>1790403
        }
    }
  }

  let(:streams){ Twitch.new(attributes) }

  context 'attributes' do
    it 'returns values' do
      expect(attributes[:game]).to be_a(String)
      expect(attributes[:channel]).to be_a(Hash)
      expect(attributes[:channel][:name]).to be_a(String)
    end
  end

  context '.get_streams' do

    before do
      VCR.insert_cassette 'twitch.get_streams', record: :new_episodes
    end

    after do
      VCR.eject_cassette
    end

    it 'returns all users' do
      streams = Twitch.get_streams
      stream  = streams.first
      
      expect(streams).to be_an(Array)
      expect(stream).to be_a(Twitch)
      expect(stream.views).to be_a(Integer)
      expect(stream.followers).to be_a(Integer)
    end
  end
end
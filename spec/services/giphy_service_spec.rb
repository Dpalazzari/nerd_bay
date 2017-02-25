require 'rails_helper'

describe GiphyService do
  context '.get_giphy' do
    it 'returns a list of trending giphys' do
      VCR.use_cassette("giphy_service.get_giphy") do
        raw_gifs = GiphyService.get_giphy
        
        expect(raw_gifs).to be_an(Array)
        gif = raw_gifs.first

        expect(gif).to be_a(Hash)
        expect(gif).to have_key(:images)
        expect(gif[:images]).to have_key(:fixed_height)
        expect(gif[:images][:fixed_height]).to have_key(:url)
      end
    end
  end
end
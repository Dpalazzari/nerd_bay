require 'rails_helper'

describe GiphyService do
  context '.get_giphy' do
    it 'returns a list of trending giphys' do
      VCR.use_cassette("giphy_service.get_giphy") do
        gif = GiphyService.get_giphy
        
        expect(gif).to be_a(Hash)
        expect(gif).to have_key(:image_url)
      end
    end
  end
end
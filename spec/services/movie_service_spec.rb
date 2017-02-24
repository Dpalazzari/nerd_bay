require 'rails_helper'

describe MovieService do
  context '.now_playing' do
    it 'returns movies currently in theatres' do
      VCR.use_cassette("movie_service.now_playing") do
        raw_movies = MovieService.now_playing
        
        expect(raw_movies).to be_an(Array)

        movie = raw_movies.first

        expect(movie).to be_a(Hash)
        expect(movie).to have_key(:title)
        expect(movie).to have_key(:release_date)
        expect(movie).to have_key(:overview)
        expect(movie).to have_key(:id)
      end
    end
  end
end
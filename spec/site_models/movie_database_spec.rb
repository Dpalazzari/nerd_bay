require 'rails_helper'

describe MovieDatabase do
  let(:attributes){
   { :poster_path=>"/wnVHDbGz7RvDAHFAsVVT88FxhrP.jpg",
     :overview=>
      "When a wounded Christian Grey tries to entice a cautious Ana Steele back into his life, she demands a new arrangement before she will give him another chance. As the two begin to build trust and find stability, shadowy figures from Christian’s past start to circle the couple, determined to destroy their hopes for a future together.",
     :release_date=>"2017-02-08",
     :title=>"Fifty Shades Darker"}
    }

  let(:movies){ MovieDatabase.new(attributes) }

  context 'attributes' do
    it 'returns movies' do
      expect(attributes[:poster_path]).to be_a(String)
      expect(attributes[:overview]).to be_a(String)
      expect(attributes[:release_date]).to be_a(String)
      expect(attributes[:title]).to be_a(String)
    end
  end  

  context '.now_playing' do
    before do
      VCR.insert_cassette 'movie_database.now_playing', record: :new_episodes
    end

    after do
      VCR.eject_cassette
    end

    it 'returns movies in theaters' do
      movies = MovieDatabase.now_playing
      expect(movies).to be_an(Array)

      movie = movies.first

      expect(movie).to be_a(MovieDatabase)
      expect(movie.image).to be_a(String)
      expect(movie.title).to be_a(String)
      expect(movie.overview).to be_a(String)
      expect(movie.release).to be_a(String)
    end
  end
end
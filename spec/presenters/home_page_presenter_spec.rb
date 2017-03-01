require 'rails_helper'

describe HomePageAttributes do
  context '.streams' do
    it 'returns twitch streams' do
      VCR.use_cassette("home_page_attributes.streams") do
        streams = HomePageAttributes.new.streams
        expect(streams.count).to eq(25)
        expect(streams).to be_an(Array)

        stream = streams.first
        expect(stream).to be_a(Twitch)
        expect(stream.methods).to include(:url)
        expect(stream.methods).to include(:logo)
        expect(stream.methods).to include(:game)
        expect(stream.methods).to include(:streamer)
        expect(stream.methods).to include(:followers)
        expect(stream.methods).to include(:views)
      end
    end
  end

  context '.movies' do
    it 'returns movies' do
      VCR.use_cassette("home_page_attributes.movies") do
        movies = HomePageAttributes.new.movies
        expect(movies).to be_an(Array)

        movie = movies.first
        expect(movie).to be_a(MovieDatabase)
        expect(movie.methods).to include(:release)
        expect(movie.methods).to include(:title)
        expect(movie.methods).to include(:image)
        expect(movie.methods).to include(:overview)
        expect(movie.methods).to include(:format_overview)
      end
    end
  end

  context '.ign_articles' do
    it 'returns ign articles' do
      VCR.use_cassette("home_page_attribtues.ign_articles") do
        articles = HomePageAttributes.new.ign_articles
        
        expect(articles).to be_an(Array)

        article = articles.first
        expect(article.methods).to include(:title)
        expect(article.methods).to include(:url)
      end
    end
  end

  context '.hacker_articles' do
    it 'returns hacker articles' do
      VCR.use_cassette("home_page_attributes.hacker_articles") do
        articles = HomePageAttributes.new.hacker_articles
        expect(articles).to be_an(Array)

        article = articles.first
        expect(article.methods).to include(:title)
        expect(article.methods).to include(:url)
      end
    end
  end

  context '.espn_articles' do
    it 'returns espn articles' do
      VCR.use_cassette("home_page_attributes.espn_articles") do
        articles = HomePageAttributes.new.espn_articles
        expect(articles).to be_an(Array)

        article = articles.first
        expect(article.methods).to include(:title)
        expect(article.methods).to include(:url)
      end
    end
  end

  context '.reddit' do
    it 'returns reddit threads' do
      VCR.use_cassette("home_page_attribtues.reddit") do
        articles = HomePageAttributes.new.reddit
        expect(articles).to be_an(Array)

        article = articles.first
        expect(article.methods).to include(:title)
        expect(article.methods).to include(:url)
      end
    end
  end
end
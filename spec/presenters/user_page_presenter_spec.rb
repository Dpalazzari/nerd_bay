require 'rails_helper'

describe UserPageAttributes do
  context '.weather' do
    it 'returns the weather statistics' do
      VCR.use_cassette("user_page_attributes.weather") do
        user = create(:user)

        weather = UserPageAttributes.new(user).weather
        
        expect(weather).to be_a(Weather)
        expect(weather.methods).to include(:description)
        expect(weather.methods).to include(:visibility)
        expect(weather.methods).to include(:temp)
        expect(weather.methods).to include(:conditions)
        expect(weather.methods).to include(:max_temp)
        expect(weather.methods).to include(:min_temp)
        expect(weather.methods).to include(:wind_speed)
      end
    end 
  end

  context '.quote'  do
    it 'returns quote of the day' do
      VCR.use_cassette('user_page_attributes.quote') do
        user = create(:user)

        quote = UserPageAttributes.new(user).quote
        
        expect(quote).to be_a(Quote)
        expect(quote.methods).to include(:quote)
        expect(quote.methods).to include(:author)
      end
    end
  end

  context '.giphy' do
    it 'returns a random giphy' do
      VCR.use_cassette("user_page_attributes.giphy") do
        user = create(:user)

        giphy = UserPageAttributes.new(user).giphy
        
        expect(giphy).to be_a(Giphy)
        expect(giphy.methods).to include(:url)
      end
    end
  end

  context '.youtube' do
    it 'returns the youtube link of the most popular video' do
      VCR.use_cassette("user_page_attributes.youtube") do
        user = create(:user)

        link = UserPageAttributes.new(user).youtube

        expect(link).to be_a(String)
      end
    end
  end
end
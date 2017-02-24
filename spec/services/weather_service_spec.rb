require 'rails_helper'

describe WeatherService do
  context '.get_data' do
    it 'returns weather data for a city' do
      VCR.use_cassette("weather_service.get_data") do
        weather = WeatherService.get_data("Denver")
        
        expect(weather).to be_a(Hash)
        expect(weather).to have_key(:weather)
        expect(weather[:weather].first).to have_key(:main)
        expect(weather[:weather].first).to have_key(:description)
        expect(weather).to have_key(:main)
        expect(weather[:main]).to have_key(:temp)
        expect(weather[:main]).to have_key(:temp_max)
        expect(weather[:main]).to have_key(:temp_min)
        expect(weather).to have_key(:visibility)
        expect(weather).to have_key(:wind)
      end
    end
  end
end
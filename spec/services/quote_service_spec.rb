require 'rails_helper'

describe QuoteService do
  context '.of_the_day' do
    it 'returns a quote of the day' do
      VCR.use_cassette('quote_service.of_the_day') do
        quote = QuoteService.of_the_day
        
        expect(quote).to be_a(Hash)
        expect(quote).to have_key(:quoteText)
        expect(quote).to have_key(:quoteAuthor)
      end
    end
  end
end
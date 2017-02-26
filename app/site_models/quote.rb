class Quote

  attr_reader :quote, :author

  def initialize(quote={})
    @quote  = quote[:quoteText]
    @author = quote[:quoteAuthor]
  end

  def self.of_the_day
    quote = QuoteService.of_the_day
    new(quote)
  end

end
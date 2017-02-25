class Quote

  attr_reader :quote, :author

  def initialize(quote={})
    @quote  = quote[:quoteText]
    @author = determine(quote[:quoteAuthor])
  end

  def self.of_the_day
    quote = QuoteService.of_the_day
    new(quote)
  end

  def determine(author)
    if author
      return author
    else
      return 'Anonymous'
    end
  end

end
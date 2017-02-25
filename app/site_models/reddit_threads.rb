class RedditThreads

  attr_reader :title, :url

  def initialize(attributes={})
    @title = format_title(attributes[:title])
    @url   = attributes[:url]
  end

  def self.top_threads
    RedditService.get_threads.map do |thread|
      new(thread)
    end
  end

  def format_title(title)
    if title
      return title[0...90]
    end
  end

end
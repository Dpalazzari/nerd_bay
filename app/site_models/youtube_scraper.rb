class YoutubeScraper

  def self.get_most_popular
    html     = Nokogiri::HTML(http.body_str)
    node     = html.css(".yt-lockup-thumbnail").first
    top_link = Nokogiri::HTML(node.inner_html).css('a').first['href']
    link     = top_link.chomp[9..-1]
    link
  end

  def self.http
    Curl.get('https://www.youtube.com/feed/trending') do |http|
      http.headers['User-Agent'] = "Mozilla/5.0 (X11; Linux x86_64; rv:12.0) Gecko/20100101 Firefox/21.0"
    end
  end

end
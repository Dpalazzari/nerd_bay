namespace :get_youtube_link do
  task :cache => :environment do
    Rails.cache.delete('youtube_link')
    link = YoutubeScraper.get_most_popular
    Rails.cache.write('youtube_link', link)
    puts Rails.cache.fetch('youtube_link') {YoutubeScraper.get_most_popular}
  end
end
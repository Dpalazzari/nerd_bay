# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.
require './app/site_models/youtube_scraper'
require_relative 'config/application'

Rails.application.load_tasks

namespace :get_youtube_link do
  task :cache => :environment do
    link = YoutubeScraper.get_most_popular
    Rails.cache.write('youtube_link', link)
    puts Rails.cache.fetch('youtube_link')
  end
end
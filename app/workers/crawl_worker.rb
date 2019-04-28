class CrawlWorker
  include Sidekiq::Worker

  def perform(id)
  	shortener_url = ShortenerUrl.find(id)
    bot = Crawler::Bot.new(shortener_url)
    bot.start
  end
end

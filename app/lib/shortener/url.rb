require 'uri'
require 'crawl_worker'

module Shortener::Url
  class << self

    def generate(url)
      @url = url
      valid?(@url) ? store : @error
    end

    def read(short_url)
      shorten = ShortenerUrl.find_by(shorten_url: short_url)
      if shorten
        { url: shorten.original_url, status: :ok }
      else
        error('Url does not exists')
      end
    end

    def valid?(url=@url)
      begin
        uri = URI.parse(url)
        uri.kind_of?(URI::HTTP) or uri.kind_of?(URI::HTTPS) ? true : error("Invalid URL")
      rescue
        error("Invalid URL")
      end
    end

    def error(message)
      @error = message
      { message: @error, status: :error }
    end

    private

    def store
      if shorten = ShortenerUrl.find_by(original_url: @url)
        { url: shorten.shorten_url, status: :ok }
      else
        token   = Shortener::Generator.run
        shorten = ShortenerUrl.create(original_url: @url, shorten_url: token)
        queue_crawler(shorten)
        token
      end
    end

    def queue_crawler(shorten)
      CrawlWorker.perform_async(shorten.id)
    end
  end
end
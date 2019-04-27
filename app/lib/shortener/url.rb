module Shortener::Url
  class << self

    def generate(url)
      @url = url
      store if valid?(@url)
    end

    def read(short_url)
      "retrive ulr"
    end

    def valid?(url=@url)
      true
    end

    private

    def store
      token = Shortener::Generator.run
      "save in database"g
    end

    def queue_crawler
      "redis-sidekiq queue to get the title"
    end
  end
end
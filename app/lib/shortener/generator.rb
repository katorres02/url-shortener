module Shortener::Generator
  class << self

    TOKEN_LENGTH = 5

    def run
      @token = source.sample(TOKEN_LENGTH).join
      token_valid?
    end

    private

    def token_valid?
      ShortenerUrl.exists?(shorten_url: @token) ? run : @token
    end

    def source
      @source ||= ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
    end
  end
end
require 'nokogiri'
require 'open-uri'

class Crawler::Bot
  attr_reader :url, :shortener_url

  def initialize(shortener_url)
    @shortener_url = shortener_url
    @url      = shortener_url.original_url
    @document = Nokogiri::HTML(open(@url))
  end

  def start
    title = get_title
    @shortener_url.update(title: title)
  end

  def get_title
    @document.at_css('title').text
  end
end
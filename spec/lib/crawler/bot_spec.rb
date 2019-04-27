require 'rails_helper'
require 'nokogiri'
require 'open-uri'

describe Crawler::Bot do
  before do
    @token = Shortener::Url.generate('https://www.google.com')
    @bot = Crawler::Bot.new(ShortenerUrl.last)
  end
  
  describe "initialize with shortener_url attributes" do
    context 'rigth attributes' do
      it 'should containt url and shortener_url' do
        expect(@bot.url).to eq('https://www.google.com')
        expect(@bot.shortener_url).to eq(ShortenerUrl.last)
      end
    end
  end

  describe 'start process' do
    context 'update title after start' do
      it 'update title when start method is called' do
        shortener_url = ShortenerUrl.last
        
        expect(shortener_url.title).to eq('Pending...')
        
        bot = Crawler::Bot.new(shortener_url)
        bot.start

        expect(shortener_url.title).to eq('Google')
      end
    end
  end


  context 'get title' do
    it 'should return the page title' do
      expect(@bot.get_title).to eq('Google')
      
      Shortener::Url.generate('https://www.dropbox.com')
      bot = Crawler::Bot.new(ShortenerUrl.last)
      bot.start

      expect(bot.get_title).to eq('Dropbox')
    end
  end
end
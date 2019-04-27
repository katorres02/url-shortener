require 'rails_helper'

describe Shortener::Url do
  describe "#run works" do      
    before do
      @token = Shortener::Url.generate('http://www.google.com')
    end

    context 'generate process' do
      it 'should store in database' do
        expect(ShortenerUrl.count).to eq(1)
        Shortener::Url.generate('http://www.facebook.com')
        expect(ShortenerUrl.count).to eq(2)
      end

      it 'should not store the same url' do
        expect(ShortenerUrl.count).to eq(1)
        Shortener::Url.generate('http://www.google.com')
        expect(ShortenerUrl.count).to eq(1)
        Shortener::Url.generate('http://www.google.com')
        expect(ShortenerUrl.count).to eq(1)
      end
    end

    context 'read, retrieve' do
      it 'should retrive from database' do
        expect(Shortener::Url.read(@token)).to eq('http://www.google.com')
      end

      it 'should retrive even if its a new record' do
        expect(Shortener::Url.read(@token)).to eq('http://www.google.com')
        token = Shortener::Url.generate('http://www.facebook.com')
        expect(Shortener::Url.read(token)).to eq('http://www.facebook.com')
      end

      it 'should return error message' do
        expect(Shortener::Url.read('xxxxx')).to eq('Url does not exists')
      end
    end

    context 'validate urls' do
      it 'should return true if valids url' do
        expect(Shortener::Url.valid?('http://www.facebook.com')).to eq(true)
        expect(Shortener::Url.valid?('http://www.google.com')).to eq(true)
      end
      
      it 'should return error message if invalid url' do
        expect(Shortener::Url.valid?('dakdhojsdam')).to eq('Invalid URL')
        expect(Shortener::Url.valid?('http:dasodjasdnbadja,dsa"')).to eq('Invalid URL')
      end
    end
  end

end
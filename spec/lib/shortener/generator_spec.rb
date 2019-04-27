require 'rails_helper'

describe Shortener::Generator do
  describe "#run works" do
    context "length expected" do
      
      before do
        @token = Shortener::Generator.run
      end

      it "lenght of token should be 5" do
        expect(@token.length).to eq(5)
      end
    end
  end

  describe "return a new token" do
    it "always return a new token" do
      expect(Shortener::Generator.run).not_to eq(Shortener::Generator.run)
      expect(Shortener::Generator.run).not_to eq(Shortener::Generator.run)
      expect(Shortener::Generator.run).not_to eq(Shortener::Generator.run)
    end
  end
end
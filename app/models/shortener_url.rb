class ShortenerUrl < ApplicationRecord
	validates :shorten_url, uniqueness: true
	validates :original_url, presence: true
end

class CreateShortenerUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :shortener_urls do |t|
      t.string :original_url
      t.string :shorten_url

      t.timestamps
    end
  end
end

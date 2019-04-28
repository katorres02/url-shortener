module Populator
  class << self

    def start
      urls = data.sample(50)
      urls.map { |x| Shortener::Url.generate(x) }
      150.times { urls.sample(1).map { |x| Shortener::Url.generate(x) } }
    end

    private

    def data
      [
        "https://www.twitter.com/",
        "https://www.google.com/",
        "https://www.instagram.com/",
        "https://www.linkedin.com/",
        "https://www.wordpress.org/",
        "https://www.pinterest.com/",
        "https://www.wikipedia.org/",
        "https://www.wordpress.com/",
        "https://www.blogspot.com/",
        "https://www.apple.com/",
        "https://www.adobe.com/",
        "https://www.tumblr.com/",
        "https://www.vimeo.com/",
        "https://www.flickr.com/",
        "https://www.microsoft.com/",
        "https://www.godaddy.com/",
        "https://www.qq.com/",
        "https://www.vk.com/",
        "https://www.w3.org/",
        "https://www.baidu.com/",
        "https://www.nytimes.com/",
        "https://www.buydomains.com/",
        "https://www.wp.com/",
        "https://www.jimdo.com/",
        "https://www.blogger.com/",
        "https://www.github.com/",
        "https://www.weebly.com/",
        "https://www.soundcloud.com/",
        "https://www.mozilla.org/",
        "https://www.bbc.co.uk/",
        "https://www.yandex.ru/",
        "https://www.myspace.com/",
        "https://www.google.de/",
        "https://www.addthis.com/",
        "https://www.nih.gov/",
        "https://www.theguardian.com/",
        "https://www.google.co.jp/",
        "https://www.cnn.com/",
        "https://www.stumbleupon.com/",
        "https://www.gravatar.com/",
        "http://www.digg.com/",
        "https://www.addtoany.com/",
        "https://www.creativecommons.org/",
        "https://www.paypal.com/",
        "https://www.imdb.com/",
        "https://www.huffingtonpost.com/",
        "https://www.feedburner.com/",
        "https://www.issuu.com/",
        "https://www.wixsite.com/",
        "https://www.wix.com/",
        "https://www.dropbox.com/",
        "https://www.forbes.com/",
        "https://www.google.co.uk/",
        "https://www.washingtonpost.com/",
        "https://www.bluehost.com/",
        "https://www.etsy.com/",
        "https://www.msn.com/",
        "https://www.wsj.com/",
        "https://www.archive.org/",
        "https://www.slideshare.net/",
        "https://www.e-recht24.de/"
        ]
    end
  end
end
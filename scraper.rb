require "insta_scrape"

class InstagramScraper
  def self.scrape(query)
    image_urls = []

    scrape_result = InstaScrape.hashtag(query || "rome")
    scrape_result.each do |post|
      image_urls.push(post.image)
    end

    image_urls
  end
end
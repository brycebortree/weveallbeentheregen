require_relative "scraper"
require_relative "downloader"
require_relative "image_recognizer"
require_relative "sentence_generator"
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
# :verify_ssl => :false

query = ARGV[0].to_s

# puts "about to scrape"
# urls_array = InstagramScraper.scrape(query || 'rome')
# puts "about to download"
# ImageDownloader.multi_image_download(urls_array, query)
# puts "about to get tags"
# tags = ImageRecognizer.get_multiple_tags(urls_array)
# puts "image tags", tags
puts "about to save new dictionary"
files = SentenceGenerator.create_dictionary_from_texts
puts 'files', files
require 'rest-client'
require 'base64'
require 'dotenv'
require 'json'
Dotenv.load


image = ARGV[0].to_s

class ImageRecognizer
  @@tags = []

  def self.get_multiple_tags(urls)
    full_tags = []
    urls.each { |url| full_tags << get_image_tags(url) }
    full_tags
  end

  def self.get_image_tags(image_url)
    api_key = ENV['API_KEY']
    api_secret = ENV['API_SECRET']
    auth = 'Basic ' + Base64.strict_encode64( "#{api_key}:#{api_secret}" ).chomp
    response = RestClient.get "https://api.imagga.com/v1/tagging?url=#{image_url}", { :Authorization => auth }
    tags = explore_results(response)
    tags
  end

  def self.explore_results(response)
    res = JSON.load(response).to_hash
    array = res["results"][0]["tags"]
    tags = []
    array.each{ |item| @@tags << item["tag"] }
    @@tags
  end

  def self.array_to_string(full_tags)
    full_tags_string = "#{full_tags.join(" ")}"
    full_tags_string
  end

  def self.string_to_file(full_tags_string, query)
    File.open('./texts/' + query, 'w:utf-8') { |file| file.write full_tags_string.join(' ')}
  end
end
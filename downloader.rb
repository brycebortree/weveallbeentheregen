require 'open-uri'
require 'fileutils'

class ImageDownloader
  def self.multi_image_download(urls, dest_folder_name)
    self.make_image_directory(dest_folder_name)
    urls.each { |url| download_image(url, dest_folder_name, url.split('/').last) }
  end

  def self.download_image(url, dest, file_name)
    open(url) do |u|
      File.open(File.join(Dir.pwd, dest, file_name),"wb") { |f| f.write(u.read) }
    end
  end

  def self.make_image_directory(dest_folder_name)
    unless File.directory?(dest_folder_name)
      FileUtils.mkdir_p(dest_folder_name)
    end
  end
end

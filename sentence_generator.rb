require 'marky_markov'

class SentenceGenerator
  def self.create_dictionary_from_texts
    markov = MarkyMarkov::Dictionary.new('dictionary', 3) # Saves/opens dictionary.mmd
    texts = get_files_in_folder('texts')
    texts.each { |text| markov.parse_file text.to_s }
    puts markov.generate_50_sentences
    markov.save_dictionary!
  end

  def self.get_files_in_folder(folder)
    files = Dir[ './' +folder.to_s+ '/*' ].select{ |f| File.file? f }
    files
  end
end
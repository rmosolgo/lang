module WikiSeedable
  require 'wikipedia'
  extend ActiveSupport::Concern

  module ClassMethods
    WIKIPEDIA_PAGES = ["List of languages by number of native speakers"]
    LANGUAGE_LINK = /\|\s'''\[\[([\w\s]+)\|([\w\s]+)\]\]'''\s\|\|\s\d+/
    def wikipedia_names
      names = []
      WIKIPEDIA_PAGES.each do |page_name|
        page = Wikipedia.find(page_name)
        page.content.scan(LANGUAGE_LINK) do
          names << $1
        end
      end
      names
    end

    def initialize_from_wikipedia(page_name, options={})
      defaults = {confirm: true}
      options = defaults.merge(options)
      confirm = options[:confirm]
      page = Wikipedia.find(page_name)
      language_name = page_name.gsub(/\slanguage/, '')
      p "#{language_name}, from '#{page_name}'"

      letters = Sound.pluck(:letter)
      letter_options = letters.join("|")

      letter_regex = /(?:IPA[a-z]*\|)[\/\[\|]?([#{letter_options}])(?:\~([#{letter_options}]))?[\/\]]?/
      found_letters = []
      page.content.scan(letter_regex) { found_letters << $1 << $2 }
      found_letters = found_letters.compact.uniq
      p found_letters.join(", ")

      lang = Language.find_or_initialize_by(name: language_name)

      if confirm
        p "Add #{found_letters.length} sounds to #{language_name}#{lang.new_record? ? " (new)" : ""}? [y/n]"
        input = STDIN.gets.chomp
        raise "Aborting. You entered #{input}" unless input == "y"
      end

      lang.save!
      found_letters.each do |letter|
        sound = Sound.find_by(letter: letter)
        raise "Couldn't find a Sound for #{letter}!" unless sound
        lang.phonemes.create(sound: sound)
      end
    end
  end
end

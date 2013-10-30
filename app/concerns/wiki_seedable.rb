module WikiSeedable
  require 'wikipedia'
  extend ActiveSupport::Concern

  module ClassMethods

    WIKIPEDIA_PAGES = [
      "List of languages by number of native speakers",
      "List of official languages",
      "list of largest languages without official status"]
    LANGUAGE_LINK = /'''\[\[([\w\s]+\slanguages?)\|([\w\s]+)\]\]'''/

    def wikipedia_names
      names = []
      WIKIPEDIA_PAGES.each do |page_name|
        p "Searching #{page_name}"
        page = Wikipedia.find(page_name)
        page.content.scan(LANGUAGE_LINK) do
          names << $1
        end
      end
      names.compact.uniq
      p "Found: #{names.join(", ")}"
      names
    end

    def scan_for_letters(page_content)
      letters = Sound.pluck(:letter)
      letter_options = letters.join("|")
      # p "Letters: #{letter_options}"
      letter_regex = /(?:IPA[a-z\-]*\|)[\/\[\|]?([#{letter_options}])(?:\~([#{letter_options}]))?[\/\]]?/
      found_letters = []
      page_content.scan(letter_regex) { found_letters << $1 << $2 }
      found_letters.compact.uniq
    end

    def initialize_from_wikipedia(page_name, options={})
      defaults = {confirm: true}
      options = defaults.merge(options)
      confirm = options[:confirm]
      page = Wikipedia.find(page_name)
      language_name = page_name.gsub(/\slanguage/, '')
      p "#{language_name}, from '#{page_name}'"

      found_letters = scan_for_letters(page.content)


      # phonology_main_page_regex = /\{\{Main\|\s#{language_name}\sphonology\}\}/
      phonology_page = Wikipedia.find("#{language_name} phonology")

      if phonology_page.content.present?
        p "checking Phonology page..."
        found_letters += scan_for_letters(phonology_page.content)
      end
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
        if sound
          # raise "Couldn't find a Sound for #{letter}!" unless sound
          ph = lang.phonemes.find_or_initialize_by(sound: sound)
          ph.save
        end
      end
    end

    # any category that mentions language:
    CATEGORY = /\[\[Category:(.*[lL]anguages?.*)\]\]/

    def categories_for(page)
      categories = []
      categories += page.content.scan(CATEGORY).map(&:first)
    end
  end
end

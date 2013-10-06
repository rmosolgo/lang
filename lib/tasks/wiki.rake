namespace :wiki do
  require 'wikipedia'
  desc "Fetch top-spoken languages"
  task top_langs: :environment do
    page = Wikipedia.find("List of languages by number of native speakers")
    language_link = /\|\s'''\[\[([\w\s]+)\|([\w\s]+)\]\]'''\s\|\|\s\d+/
    page.content.scan(language_link) do
      print "#{$1}\t\t#{$2}\n"
    end
  end

  desc "Fetch info for a given language"
  task :lang, [:language] => :environment do |t, args|
    page = Wikipedia.find(args.language)
    language_name = page.title.gsub(/\slanguage/, '')
    p "#{language_name}, from '#{page.title}'"

    letters = Sound.pluck(:letter)
    letter_options = letters.join("|")
    # p "Looking for: #{letter_options}"
    letter_regex = /[\/\[]([#{letter_options}])(?:\~([#{letter_options}]))?[\/\]]/
    found_letters = []
    page.content.scan(letter_regex) { found_letters << $1 << $2 }
    found_letters = found_letters.compact.uniq
    p found_letters.join ","

    lang = Language.find_or_initialize_by(name: language_name)
    p "Add #{found_letters.length} sounds to #{language_name}#{lang.new_record? ? " (new)" : ""}? [y/n]"
    input = STDIN.gets.chomp
    raise "Aborting. You entered #{input}" unless input == "y"
    lang.save!
    found_letters.each do |letter|
      sound = Sound.find_by(letter: letter)
      raise "Couldn't find a Sound for #{letter}!" unless sound
      lang.phonemes.create(sound: sound)
    end

  end
end

namespace :wiki do
  require 'wikipedia'
  desc "Fetch language names"
  task  langs: :environment do
    Language.wikipedia_names.each { |n| p n}
  end

  desc "Fetch info for a given language"
  task :lang, [:language] => :environment do |t, args|
    Language.initialize_from_wikipedia(args.language)
  end
end

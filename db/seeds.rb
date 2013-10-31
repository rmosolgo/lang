
# require all ruby files in /db/seeds
Dir.glob("#{Rails.root}/db/seeds/**/*.rb").each do |file|
  require file
end

FEATURE_SETS = [
  { feature_type: "backness", values: VOWEL_BACKNESSES },
  { feature_type: "height", values: VOWEL_HEIGHTS },
  { feature_type: "roundedness", values: VOWEL_ROUNDEDNESSES },

  { feature_type: "place", values: CONSONANT_PLACES },
  { feature_type: "manner", values:  CONSONANT_MANNERS },
  { feature_type: "voice", values: CONSONANT_VOICES },
  { feature_type: "type", values: CONSONANT_TYPES}

]

FeatureSound.destroy_all

Feature.find_each(&:destroy)
FEATURE_SETS.each do |set|
  set[:values].each do |n|
    Feature.find_or_create_by(name: n, feature_type: set[:feature_type])
  end
end


Diacritic.find_each(&:destroy)
DIACRITICS.each do |diacritic|
  feature = Feature.find_by(name: diacritic[:feature_name])
  if feature
    raise "No feature for #{diacritic[:letter]}!" unless feature
    new_d = Diacritic.find_or_create_by(letter: diacritic[:letter], feature: feature)
  end
end


Sound.find_each(&:destroy)
(VOWELS + CONSONANTS).each do |sound|
  new_sound = Sound.find_or_create_by(letter: sound[:letter])
  new_sound.features = []

  sound[:features].each do |f|
    feature = Feature.find_by(name: f)
    raise "Feature #{f} not created." unless feature
    new_sound.features << feature
  end
  new_sound.save!
end

Tag.destroy_all
Tagging.destroy_all
Phoneme.destroy_all
Language.destroy_all
Language.wikipedia_names.each do |name|
  Language.initialize_from_wikipedia(name, confirm: false)
end

LanguageMetric.destroy_all

LanguageMetrics.seed!





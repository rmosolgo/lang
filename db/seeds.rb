
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

Feature.find_each(&:destroy)

FEATURE_SETS.each do |set|
  set[:values].each do |n| 
    Feature.find_or_create_by(name: n, feature_type: set[:feature_type]) 
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


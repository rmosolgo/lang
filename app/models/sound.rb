class Sound < ActiveRecord::Base
  include FeatureScopeable

  # relations
  has_many :feature_sounds, dependent: :destroy
  has_many :features, through: :feature_sounds
  has_many :phonemes
  has_many :languages, through: :phonemes, uniq: true

  def feature_names
    features.map(&:name)
  end

  # validations
  validates_uniqueness_of :letter

  VOWEL_ORDER = [
    "height", "backness", "roundedness"
  ]
  CONSONANT_ORDER = [
    "voice", "place", "manner",
  ]
  FULL_NAME_ORDER = VOWEL_ORDER + CONSONANT_ORDER

  def frequency(langs=Language)
    lang_count = langs.count
    if lang_count > 0
      languages.count / (lang_count * 1.0)
    else
      0
    end
  end
  def to_s
    letter
  end

  def full_name
    name_words = []
    FULL_NAME_ORDER.each do |feature_type|
      name_words << features.where(feature_type: feature_type).map(&:name)
    end
    name_words.join(" ")
  end

  def self.method_missing(method_name, *args, &block)
    warm_features!
    feature_name = method_name.to_s.sub(/^no[tn]\_/, '').gsub(/\?!/, '').singularize
    if ft = Feature.find_by(name: feature_name)
      self.define_feature_scopes(feature_name)
      return self.send(method_name)
    end
    super(method_name, *args, &block)
  end

  def method_missing(method_name, *args, &block)
    Sound.warm_features!
    feature_name = method_name.to_s.sub(/^no[tn]\_/, '').gsub(/\?!/, '').singularize
    if ft = Feature.find_by(name: feature_name)
      self.send(method_name, *args, &block)
    end
    super # (method_name, *args, &block)
  end


  def to_english
    letter
  end

  def to_param
    letter
  end

  def to_api_query
    "/api/sounds/#{letter}"
  end
end

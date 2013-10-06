class Sound < ActiveRecord::Base
  include FeatureScopeable

  # relations
  has_and_belongs_to_many :features, -> { uniq }
  has_and_belongs_to_many :languages

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
  def to_english
    letter
  end

  # def to_param
  #   letter
  # end

  def to_api_query
    "/api/sounds/#{letter}"
  end
end

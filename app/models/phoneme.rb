class Phoneme < ActiveRecord::Base
  include FeatureScopeable

  belongs_to :sound, inverse_of: :phonemes
  has_many :feature_sounds, primary_key: :sound_id, foreign_key: :sound_id
  has_many :features, through: :feature_sounds, uniq: true

  belongs_to :language, inverse_of: :phonemes
  validates_presence_of :language_id, :sound_id

  # default_scope {includes(:sound).order("sounds.letter")}

  delegate :frequency, :letter, :feature_names, to: :sound, allow_nil: true

  def self.method_missing(method_name, *args, &block)
    warm_features!
    feature_name = method_name.to_s.sub(/^no[tn]\_/, '').gsub(/\?!/, '').singularize
    if ft = Feature.find_by(name: feature_name)
      self.define_feature_scopes(feature_name)
      return self.send(method_name)
    end

    super(method_name, *args, &block)
  end

  def method_missing(method_name, *arg, &block)
    Phoneme.warm_features!
    feature_name = method_name.to_s.sub(/^no[tn]\_/, '').gsub(/\?!/, '').singularize
    if ft = Feature.find_by(name: feature_name)
      self.define_feature_scopes(feature_name)
      return self.send(method_name)
    end
    super
  end

  def to_english
    letter
  end
  def to_api_query
    letter
  end
end

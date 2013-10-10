class Feature < ActiveRecord::Base

  # relations
  has_many :feature_sounds,  dependent: :destroy
  has_many :sounds, through: :feature_sounds
  has_and_belongs_to_many :phonemes, association_foreign_key: :sound_id, join_table: "features_sounds"

  # validations
  validates_uniqueness_of :name

  def self.feature_types
    select(:feature_type).distinct.pluck(:feature_type)
  end
  include FeatureTypeScopeable

  def self.method_missing(method_name, *args, &block)
    # possibly add a scope for a feature type
    possible_feature_type = method_name.to_s.singularize
    if self.feature_types.include?(possible_feature_type)
      warm_feature_types!
      define_feature_type_scopes(possible_feature_type)
      return Feature.send(method_name)
    end

    if Feature.find_by(name: method_name.to_s)
      warm_feature_names!
      return  define_feature_name_scope(method_name.to_s)
    end

    super(method_name, *args, &block)
  end

  # def to_param
  #   name
  # end

  def to_english
    name
  end

  def to_api_query
    "/api/features/#{name}"
  end
end

class Feature < ActiveRecord::Base

  # relations
  has_and_belongs_to_many :sounds, -> { uniq }
  
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
      feature_type_scope(possible_feature_type)
      return Feature.send(method_name)
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

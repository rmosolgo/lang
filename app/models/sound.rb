class Sound < ActiveRecord::Base
  include FeatureScopeable
  
  # relations
  has_and_belongs_to_many :features, -> { uniq }
  # validations
  validates_uniqueness_of :letter

  def self.method_missing(method_name, *args, &block)
    feature_name = method_name.to_s.singularize
    if ft = Feature.find_by(name: feature_name)
      self.feature_scope(feature_name)
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

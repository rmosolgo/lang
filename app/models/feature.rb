class Feature < ActiveRecord::Base
  
  # relations
  has_and_belongs_to_many :sounds, uniq: true
  
  # validations
  validates_uniqueness_of :name

  def to_english
    name
  end

  def to_api_query
    "/api/features/#{name}"
  end
end

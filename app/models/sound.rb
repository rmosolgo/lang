class Sound < ActiveRecord::Base
  # relations
  has_and_belongs_to_many :features 
  # validations
  validates_uniqueness_of :letter

  def to_english
    letter
  end

  def to_api_query 
    "/api/sounds/#{letter}"
  end
end

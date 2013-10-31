class Tag < ActiveRecord::Base
  has_many :taggings, -> { uniq }, dependent: :destroy
  has_many :languages, through: :taggings, source: :tagged, source_type: "Language"
  validates_uniqueness_of :name

  def to_s
    name
  end
  def to_param
    name
  end
  def to_api_query
    name
  end
  def to_english
    name
  end
end

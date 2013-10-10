class Language < ActiveRecord::Base
  include WikiSeedable

  has_many :phonemes, dependent: :destroy, uniq: true
  validates :name, presence: true, uniqueness: true

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

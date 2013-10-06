class Language < ActiveRecord::Base
  has_many :phonemes
  validates :name, presence: true, uniqueness: true

  def to_api_query
    name
  end
  def to_english
    name
  end
end

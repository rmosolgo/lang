class Language < ActiveRecord::Base
  include WikiSeedable

  has_many :phonemes, -> { uniq },  dependent: :destroy
  validates :name, presence: true, uniqueness: true
  has_many :language_metric_values
  has_many :language_metrics, through: :language_metric_values

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

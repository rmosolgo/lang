class Diacritic < ActiveRecord::Base
  belongs_to :feature
  delegate :name, to: :feature, prefix: true, allow_nil: true
  has_many :sounds, through: :feature

  validates_uniqueness_of :letter
end

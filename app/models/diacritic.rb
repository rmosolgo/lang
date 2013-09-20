class Diacritic < ActiveRecord::Base
  belongs_to :feature
  has_many :sounds, through: :feature

  validates_uniqueness_of :letter
end

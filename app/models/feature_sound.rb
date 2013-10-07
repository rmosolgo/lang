class FeatureSound < ActiveRecord::Base
  belongs_to :sound
  belongs_to :feature
end

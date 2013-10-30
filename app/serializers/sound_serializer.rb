class SoundSerializer < ActiveModel::Serializer
  attributes :id, :letter, :frequency
  has_many :features
end

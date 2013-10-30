class LanguageSerializer < ActiveModel::Serializer
  self.root = false

  attributes :id, :name
  has_many :phonemes

end

class Language < ActiveRecord::Base
  include WikiSeedable

  has_many :phonemes, dependent: :destroy, uniq: true
  validates :name, presence: true, uniqueness: true

  # eventually counter-cache these:
  def self.most_phonemes
    lang_id = Phoneme.select("language_id, count(*) as count").group(:language_id).order("count desc").first.language_id
    Language.find(lang_id)
  end


  def phonemic_complexity
    # 1 is mean
    own_phonemes = phonemes.count * 1.0
    own_phonemes / Phoneme.mean
  end

  def percent_of_max_phonemes
    own_phonemes = phonemes.count * 1.0
    own_phonemes / Phoneme.most
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

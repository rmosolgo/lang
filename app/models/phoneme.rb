class Phoneme < ActiveRecord::Base
  belongs_to :sound
  belongs_to :language
  validates_presence_of :language_id, :sound_id
  delegate :letter, to: :sound
  default_scope {includes(:sound).order("sounds.letter")}

  def method_missing(method, *args, &block)
    if sound.respond_to?(method)
      sound.send(method, *args, &block)
    end
    super
  end

  def to_english
    letter
  end
  def to_api_query
    letter
  end
end

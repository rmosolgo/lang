class Tagging < ActiveRecord::Base
  belongs_to :tag
  belongs_to :tagged, polymorphic: true
  validates_uniqueness_of :tagged_id, scope: :tag_id

  def to_english
    "#{tagged} &rarr; #{tag}".html_safe
  end
end

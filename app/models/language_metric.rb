class LanguageMetric < ActiveRecord::Base
  has_many :language_metric_values, dependent: :destroy
  has_many :languages, through: :language_metric_values

  def to_s
    name.underscore.humanize.titleize
  end

  def max_languages
    # allows for rounding issues:
    language_metric_values.where(value: (max * 0.95)..(max * 1.05)).includes(:language).map(&:language)
  end

  def min_languages
    # allows for rounding issues:
    langs = language_metric_values.where(value: (min * 0.95)..(min * 1.05)).includes(:language).map(&:language)
  end

  def stats!
    max = language_metric_values.maximum("value")
    min = language_metric_values.minimum("value")
    mean = language_metric_values.average('value')
    update_attributes max: max, min: min, mean: mean
  end
end

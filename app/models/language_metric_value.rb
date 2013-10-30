class LanguageMetricValue < ActiveRecord::Base
  belongs_to :language
  belongs_to :language_metric

  delegate :max, :min, :mean,
    :max_languages, :min_languages,
    to: :language_metric, allow_nil: true
  def percentile
    value / language_metric.max
  end
end

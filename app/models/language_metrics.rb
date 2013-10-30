Dir[File.dirname(__FILE__) + "/language_metrics/**/*.rb"].each do |file|
  require file
end

module LanguageMetrics
  METRICS = LanguageMetrics.constants.select { |c| LanguageMetrics.const_get(c).is_a?(Class) }.map {|c| c.to_s.classify }

  def self.seed!
    METRICS.each do |m|
      p "Seeding #{m}"
      db_metric = LanguageMetric.find_or_create_by(name: m)
      metric_class = "LanguageMetrics::#{m}".constantize
      Language.find_each do |language|
        metric_value = LanguageMetricValue.find_or_initialize_by(language_id: language.id, language_metric_id: db_metric.id)
        metric_value.value = metric_class.calculate_for(language)
        metric_value.save!
      end
      db_metric.stats!
    end
  end

end

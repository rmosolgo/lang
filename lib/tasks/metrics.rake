namespace :metrics do
  desc "Populate Metrics"
  task  seed: :environment do
    p LanguageMetrics::METRICS
    LanguageMetrics.seed!
  end
end

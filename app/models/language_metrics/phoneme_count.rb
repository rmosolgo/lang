module LanguageMetrics
  class PhonemeCount
    def self.calculate_for(language)
      language.phonemes.count
    end
  end
end

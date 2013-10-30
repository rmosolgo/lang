module LanguageMetrics
  class PhonemeRarity
    def self.calculate_for(language)
      if language.phonemes.any?
        sum_of_frequency = language.phonemes.map(&:frequency).sum
        sum_of_frequency / language.phonemes.count
      else
        0
      end
    end
  end
end

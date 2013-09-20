FactoryGirl.define do

  factory :diacritic do
    sequence :letter do |n|
      %w{̩ ̈ ̞ ʷ ̴ ̙ ˞ ˤ ̽}[n]
    end

    trait :with_feature do
      feature
    end
  end
end

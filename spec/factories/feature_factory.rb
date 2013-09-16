FactoryGirl.define do
  factory :feature do |s|
    s.name Faker::Lorem.word
    s.feature_type Faker::Lorem.word

    trait :rounded do
      name "rounded"
      feature_type "roundedness"
    end
    trait :open do
      name "open"
      feature_type "height"
    end
    trait :nasal do
      name "nasal"
      feature_type "manner"
    end
    trait :bilabial do
      name "bilabial"
      feature_type "place"
    end
  end
end
    
FactoryGirl.define do
  factory :language do
    name Faker::Lorem.words(5).join(" ")
  end
end

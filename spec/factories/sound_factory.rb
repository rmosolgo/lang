FactoryGirl.define do
  LETTERS = %w{ç ʝ x ɣ χ ʁ ħ ʕ ʜ ʢ h ɦ} + ('a'..'z').to_a
  sequence :letter do |n|
    LETTERS[n]
  end

  factory :sound do |s|
    letter
    
    [:nasal, :bilabial, :fricative].each do |ft|
      trait ft do
        after(:build) do |object|
          object.features << Feature.find_or_create_by(name: ft.to_s)
        end
      end
    end
  end
end
    
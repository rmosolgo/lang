FactoryGirl.define do
  factory :sound do |s|
    s.letter { %w{ç ʝ x ɣ χ ʁ ħ ʕ ʜ ʢ h ɦ}.sample }
  end
end
    
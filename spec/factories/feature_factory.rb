FactoryGirl.define do
  factory :feature do |s|
    s.name Faker::Lorem.word
    s.feature_type Faker::Lorem.word

    feature_data = {
      roundedness: [:rounded],
      height: [:open],
      manner: [:nasal, :fricative],
      place: [:bilabial],
    }
    
    feature_data.each do |f_type, f_names|
      f_names.each do |f_name|
        trait f_name do
          name f_name.to_s
          feature_type f_type.to_s
        end
      end
    end
  end
end
    
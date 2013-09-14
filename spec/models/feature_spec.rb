require 'spec_helper'

describe Feature do
  let(:feature) { build :feature }

  subject {feature}

  it {should be_valid}
  it_behaves_like "data value"
  
  describe '#name' do
    before do 
      feature.save!
      @other_feature = build :feature, name: feature.name
    end

    it "must be unique" do
      @other_feature.should_not be_valid
    end
  end

  describe '#sounds' do 
    before do 
      3.times do 
        feature.sounds << build(:sound)
      end
      feature.save!
    end

    it 'has_many' do
      feature.sounds.count.should == 3
    end
  end
end

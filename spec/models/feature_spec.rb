require 'spec_helper'

describe Feature do
  let(:feature) { build :feature }

  subject {feature}

  it {should be_valid}
  it_behaves_like "data value"
  
  describe '.feature_types' do
    before do 
      create :feature, :rounded
      create :feature, :open
    end

    it "lists feature types" do
      Feature.feature_types.should == ["height", "roundedness"]
    end

    describe "dynamic feature types" do 
      it "accepts plural" do
        Feature.heights.should == Feature.where(feature_type: "height")
      end
      it "accepts singular" do
        Feature.roundedness.should == Feature.where(feature_type: "roundedness")
      end
    end
  end

  describe 'dynamic feature_names' do
    before do
      create :feature, :rounded
    end

    it "returns the feature" do
      Feature.rounded.should == Feature.find_by(name: "rounded")
    end
  end
  
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

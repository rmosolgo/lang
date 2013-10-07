require 'spec_helper'

describe Sound do
  let(:sound) { build :sound }

  subject { sound }
  it 'has a valid factory' do
    should be_valid
  end

  describe '#full_name' do
    it {should respond_to(:full_name)}
    it "returns a string" do
      sound.full_name.should be_a(String)
    end
  end

  describe 'introspection' do
    let(:m){create(:sound, :m)}
    before do
      create(:feature, :rounded)
      create(:feature, :fricative)
      m.save!
      Sound.warm_features!
    end
    it "should respond to introspection" do
      m.nasal?.should == true
      m.fricative?.should == false
      m.not_bilabial?.should == false
      m.not_rounded?.should == true
    end
  end

  describe 'feature scopes' do
    before do
      create(:sound, :nasal, letter: "n")
      create(:sound, :bilabial, letter: "b")
      create(:sound, :bilabial, :nasal, letter: "m")
      create(:sound, :fricative, letter: "s")

      @nasals = Sound.joins(:features).where(features: { name: "nasal" })
      @non_nasals = Sound.all.reject { |sound| sound.feature_names.include?('nasal') }

      @non_bilabials = Sound.all.reject { |sound| sound.feature_names.include?('bilabial') }
      @bilabials = Sound.joins(:features).where(features: { name: "bilabial" })
    end

    it "filters by feature" do
      @nasals.length.should == 2
      @bilabials.length.should == 2
      Sound.nasal.length.should == 2
      Sound.bilabials.length.should == 2
    end

    it "filters by negative feature" do
      @non_nasals.length.should == 2
      @non_bilabials.length.should == 2

      Sound.non_nasal.length.should == 2
      Sound.non_nasals.length.should == 2
      Sound.not_bilabial.length.should == 2
      Sound.not_bilabials.length.should == 2
    end

    it "chains" do
      bilabial_nasals = @nasals & @bilabials
      bilabial_nasals.length.should == 1
      Sound.bilabial.nasal.should == bilabial_nasals
      Sound.bilabials.not_nasal.to_a.should == (@bilabials - @nasals)
    end
  end

  describe '#features' do
    before do
      3.times do
        feature = build(:feature)
        sound.features << feature
      end
      sound.save!
    end

    it "has_many" do
      sound.features.length.should == 3
    end
  end

  describe '#letter' do
    before do
      sound.save!
      @other_sound = build :sound, letter: sound.letter
    end

    it "must be unique" do
      @other_sound.should_not be_valid
    end
  end
end

require 'spec_helper'

describe Sound do
  let(:sound) { build :sound }

  subject { sound }
  it 'has a valid factory' do 
    should be_valid
  end

  it_behaves_like 'data value'

  describe 'feature scopes' do
    before do
      create(:sound, :nasal, letter: "n")
      create(:sound, :bilabial, letter: "b")
      create(:sound, :bilabial, :nasal, letter: "m")

      @nasals = Sound.joins(:features).where(features: { name: "nasal" })
      @bilabials = Sound.joins(:features).where(features: { name: "bilabial" })
    end

    it "filters by feature" do
      @nasals.length.should == 2
      @bilabials.length.should == 2
      Sound.nasal.length.should == 2
      Sound.bilabials.length.should == 2 
    end

    it "chains" do
      bilabial_nasals = @nasals & @bilabials
      bilabial_nasals.length.should == 1
      Sound.bilabial.nasal.should == bilabial_nasals
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

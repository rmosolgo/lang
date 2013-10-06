require 'spec_helper'

describe Diacritic do
  let(:diacritic) { build :diacritic }
  let(:nasal){ create(:feature, :nasal)}
  let(:nasal_diacritic){create(:diacritic, letter: "~", feature: nasal)}
  let(:bilabial_nasal) { create(:sound, :bilabial, :nasal, letter: "m")}
  let(:alveolar_nasal) { create(:sound, :alveolar, :nasal, letter: "n")}
  subject {diacritic}
  it { should be_valid }

  describe '#letter' do
    before do
      diacritic.save!
    end
    it "must be unique" do
      other_diacritic = build(:diacritic, letter: diacritic.letter)
      other_diacritic.should_not be_valid
    end
  end

  describe "#feature" do
    it "has a feature with its feature name" do
      nasal_diacritic.feature.name.should == "nasal"
      nasal_diacritic.feature_name.should == "nasal"
    end
  end
  describe "#sounds" do
    before do
      nasal.save
      bilabial_nasal.save
      alveolar_nasal.save
    end

    it "has the same sounds as its feature" do
      nasal_diacritic.sounds.length.should == 2
      nasal_diacritic.sounds.map(&:letter).should include("m")
      nasal_diacritic.sounds.map(&:letter).should include("n")
    end
  end
end

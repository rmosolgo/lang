require 'spec_helper'

describe Language do
  let(:lang) {create(:language)}
  it "has a valid factory" do
    lang.should be_valid
  end

  describe "#phonemes" do
    let(:alveolar_fricative){create(:sound, :alveolar, :fricative, letter: "s")}
    let(:bilabial_nasal){create(:sound, :bilabial, :nasal, letter: "m")}
    before do
      lang.phonemes.build(sound: alveolar_fricative)
      lang.phonemes.build(sound: bilabial_nasal)
      lang.save!
      Phoneme.warm_features!
    end
    it "has phonemes" do
      lang.phonemes.count.should == 2
    end

    it "sounds are scopable" do
      lang.phonemes.bilabial.length.should == 1
      lang.phonemes.alveolar.map(&:letter).should == ["s"]
    end
  end
end

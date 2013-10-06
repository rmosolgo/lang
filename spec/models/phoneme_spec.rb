require 'spec_helper'

describe Phoneme do
  let(:lang){create(:language)}
  let(:m){create(:sound, :m)}
  let(:phoneme){build(:phoneme, sound: m, language: lang)} #, langauge: lang, sound: bilabial_nasal)}

  it "has a valid factory" do
    phoneme.should be_valid
  end

  it "delegates methods to #sound" do
    phoneme.nasal?.should == true
    phoneme.not_fricative?.shoud == true
  end
end

require 'spec_helper'

describe Phoneme do
  let(:lang){create(:language)}
  let(:m){ create(:sound, :m)}
  let(:n){ create(:sound, :n)}
  let(:b){ create(:sound, :b)}
  let(:s){ create(:sound, :s)}
  let(:phoneme){create(:phoneme, sound: m, language: lang)} #, langauge: lang, sound: bilabial_nasal)}

  it "has a valid factory" do
    phoneme.should be_valid
  end

  it "introspects features" do
    m.save!
    s.save!
    Phoneme.warm_features!
    phoneme.nasal?.should == true
    phoneme.not_fricative?.should == true
  end

  describe 'feature scopes' do
    let(:phonemes) { lang.phonemes }
    before do
      lang.phonemes.create(sound: s)
      lang.phonemes.create(sound: b)
      lang.phonemes.create(sound: n)
      lang.phonemes.create(sound: m)
      Phoneme.warm_features!

      @nasals = phonemes.select { |ph| ph.feature_names.include?('nasal') }
      @non_nasals = phonemes.reject { |ph| ph.feature_names.include?('nasal') }

      @non_bilabials = phonemes.reject { |ph| ph.feature_names.include?('bilabial') }
      @bilabials = phonemes.select {|ph| ph.feature_names.include?("bilabial")}
    end
    it "is setup right" do
      Phoneme.count.should == 4
      phonemes.count.should == 4
    end

    it "filters by feature" do
      @nasals.length.should == 2
      @bilabials.length.should == 2
      phonemes.nasal.length.should == 2
      phonemes.bilabials.length.should == 2
    end

    it "filters by negative feature" do
      @non_nasals.length.should == 2
      @non_bilabials.length.should == 2

      phonemes.non_nasal.length.should == 2
      phonemes.non_nasals.length.should == 2
      phonemes.not_bilabial.length.should == 2
      phonemes.not_bilabials.length.should == 2
    end

    it "chains" do
      bilabial_nasals = @nasals & @bilabials
      bilabial_nasals.length.should == 1
      phonemes.bilabial.nasal.should == bilabial_nasals
      phonemes.bilabials.not_nasal.to_a.should == (@bilabials - @nasals)
    end
  end
end

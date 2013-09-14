require 'spec_helper'

describe Sound do
  let(:sound) { build :sound }

  subject { sound }
  it 'has a valid factory' do 
    should be_valid
  end

  it_behaves_like 'data value'

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

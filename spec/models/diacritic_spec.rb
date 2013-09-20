require 'spec_helper'

describe Diacritic do
  let(:diacritic) { build :diacritic }
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
end

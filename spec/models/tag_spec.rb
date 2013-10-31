require 'spec_helper'

describe Tag do
  let(:tag){Tag.new(name: "Awesome Languages")}
  let(:language){build(:language)}

  it "can be applied to a language" do
    language.tags << tag
    language.should be_valid
    language.tags.length.should == 1
  end

  it "has a unique name" do
    tag.save!
    Tag.new(name: tag.name).should_not be_valid
  end
end

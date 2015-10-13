require 'rails_helper'

RSpec.describe Tag, type: :model do
  it "is valid with a slug and name" do
    expect(FactoryGirl.build(:tag)).to be_valid
  end

  it "is invalid without a slug" do
    tag = FactoryGirl.build(:tag, slug: nil)
    expect(tag).not_to be_valid
  end

  it "is invalid without a name" do
    tag = FactoryGirl.build(:tag, name: nil)
    expect(tag).not_to be_valid
  end

  it "is invalid with non unique value" do
    tag = FactoryGirl.create(:tag)
    expect(tag).to be_valid
    # second
    expect(FactoryGirl.build(:tag)).not_to be_valid
  end
end

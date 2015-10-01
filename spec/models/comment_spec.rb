require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "is valid with an author name, content and commentable type" do
    expect(FactoryGirl.build(:comment)).to be_valid
  end

  it "is valid without an author name" do
    comment = FactoryGirl.build(:comment, author_name: nil)
    expect(comment).to be_valid
  end

  it "is invalid without a content" do
    comment = FactoryGirl.build(:comment, content: nil)
    expect(comment).not_to be_valid
  end

  it "is invalid without a commentable type" do
    comment = FactoryGirl.build(:comment, commentable_type: nil)
    expect(comment).not_to be_valid
  end
end

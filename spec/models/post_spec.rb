require 'rails_helper'

RSpec.describe Post, type: :model do
  it "is valid with a title, content and author name" do
    expect(FactoryGirl.build(:post)).to be_valid
  end

  it "is invalid without a title" do
    post = FactoryGirl.build(:post, title: nil)
    expect(post).not_to be_valid
  end

  it "is invalid without a content" do
    post = FactoryGirl.build(:post, content: nil)
    expect(post).not_to be_valid
  end

  it "is invalid without an author name" do
    post = FactoryGirl.build(:post, author_name: nil)
    expect(post).not_to be_valid
  end
end

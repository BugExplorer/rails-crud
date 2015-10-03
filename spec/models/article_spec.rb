require 'rails_helper'

RSpec.describe Article, type: :model do
  it "is valid with a title, content and author name" do
    expect(FactoryGirl.build(:article)).to be_valid
  end

  it "is invalid without a title" do
    article = FactoryGirl.build(:article, title: nil)
    expect(article).not_to be_valid
  end

  it "is invalid without a content" do
    article = FactoryGirl.build(:article, content: nil)
    expect(article).not_to be_valid
  end

  it "is invalid without an author name" do
    article = FactoryGirl.build(:article, author_name: nil)
    expect(article).not_to be_valid
  end

  it "is invalid with long title" do
    article = FactoryGirl.build(:article, title: "a" * 256)
    expect(article).not_to be_valid
  end

  it "is invalid with long author name" do
    article = FactoryGirl.build(:article, author_name: "a" * 66)
    expect(article).not_to be_valid
  end
end

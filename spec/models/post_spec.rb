require 'rails_helper'

RSpec.describe Post, type: :model do
  it "is valid with a title, content and author name" do
    post = Post.new(
      title: "Title",
      content: "Content",
      author_name: "User")
    expect(post).to be_valid
  end

  it "is invalid without an title" do
    post = Post.new(
      title: "",
      content: "Content",
      author_name: "User")
    expect(post).not_to be_valid
  end

  it "is invalid without an content" do
    post = Post.new(
      title: "Title",
      content: "",
      author_name: "User")
    expect(post).not_to be_valid
  end

  it "is invalid without an author name" do
    post = Post.new(
      title: "Title",
      content: "Content",
      author_name: "")
    expect(post).not_to be_valid
  end
end

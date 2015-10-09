require 'populator'

namespace :populate do
  desc "Create random posts"
  task posts: :environment do
    Post.populate(100..200) do |post|
      post.title = Populator.words(5..10)
      post.content = Populator.paragraphs(3..4)
      post.author_name = Faker::Name.name
    end
  end

  desc "Create random articles"
  task articles: :environment do
    Article.populate(100..200) do |article|
      article.title = Populator.words(5..10)
      article.content = Populator.paragraphs(3..4)
      article.description = Populator.paragraphs(1..2)
      article.author_name = Faker::Name.name
    end
  end

  desc "Create random tags"
  task tags: :environment do
    Tag.populate(5..10) do |tag|
      tag.name = Faker::Internet.user_name
      tag.slug = Faker::Internet.slug
    end
  end
end

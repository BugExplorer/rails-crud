require 'populator'

namespace :populate do
  desc "Create random tags"
  task tags: :environment do
    Tag.populate(25) do |tag|
      tag.name = Faker::Address.city
      tag.slug = Faker::Internet.slug
    end
  end

  desc "Create random posts"
  task posts: :environment do
    tags = ('1'..'25').to_a
    Post.populate(50..100) do |post|
      post.title = Populator.words(5..10)
      post.content = Populator.paragraphs(3..4)
      post.author_name = Faker::Name.name
      array = tags.sample(3).sort
      post.tag_ids = "{" + array.map{ |i| '"%s"' % i }.join(', ').to_s + "}"
    end
  end

  desc "Create random articles"
  task articles: :environment do
    tags = ('1'..'25').to_a
    Article.populate(50..100) do |article|
      article.title = Populator.words(5..10)
      article.content = Populator.paragraphs(3..4)
      article.description = Populator.paragraphs(1..2)
      article.author_name = Faker::Name.name
      array = tags.sample(3).sort
      article.tag_ids = "{" + array.map{ |i| '"%s"' % i }.join(', ').to_s + "}"
    end
  end
end

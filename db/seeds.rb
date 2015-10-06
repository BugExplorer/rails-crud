# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


10.times do |n|
  name = Faker::Name.first_name + n.to_s
  Tag.create!(name: name,
              slug: name)
end

30.times do
  title = Faker::Lorem.word.capitalize
  content = Faker::Lorem.sentence(7)
  author_name = Faker::Name.first_name

  tag_ids = []
  5.times { tag_ids << rand(1..10) }

  Post.create!(title: title,
               content: content,
               author_name: author_name,
               tag_ids: tag_ids)
end

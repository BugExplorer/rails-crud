class Post < ActiveRecord::Base
  validates :title,       presence: true
  validates :content,     presence: true
  validates :author_name, presence: true
end

class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true

  validates :author_name, length: { maximum: 65 }
  validates :content, presence: true
  validates :commentable_type, inclusion: { in: %w(Post) }
end

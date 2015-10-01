class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true

  validates :content, presence: true
  validates :commentable_type, inclusion: { in: %w(Post) }
end

class Post < ActiveRecord::Base
  default_scope -> { order(created_at: :desc) }
  validates :title,       presence: true, length: { maximum: 255 }
  validates :author_name, presence: true, length: { maximum: 65 }
  validates :content,     presence: true


  has_many :comments, :as => :commentable
end

class Post < ActiveRecord::Base
  include Taggable

  default_scope -> { order(created_at: :desc) }

  validates :title,       presence: true, length: { maximum: 255 }
  validates :author_name, presence: true, length: { maximum: 65 }
  validates :content,     presence: true

  has_one :picture, as: :assetable, dependent: :destroy
  accepts_nested_attributes_for :picture
  has_many :comments, as: :commentable, dependent: :delete_all
end

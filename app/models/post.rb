# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  title       :string
#  content     :string
#  author_name :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  tag_ids     :integer          default([]), is an Array
#

class Post < ActiveRecord::Base
  include Taggable
  include Commentable

  default_scope -> { order(created_at: :desc) }

  validates :title,       presence: true, length: { maximum: 255 }
  validates :author_name, presence: true, length: { maximum: 65 }
  validates :content,     presence: true

  has_one :picture, as: :assetable, dependent: :destroy
  accepts_nested_attributes_for :picture

end

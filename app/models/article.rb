# == Schema Information
#
# Table name: articles
#
#  id          :integer          not null, primary key
#  title       :string
#  content     :string
#  author_name :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :text
#  tag_ids     :integer          default([]), is an Array
#

class Article < ActiveRecord::Base
  include Taggable

  default_scope -> { order(created_at: :desc) }

  validates :title,       presence: true, length: { maximum: 255 }
  validates :author_name, presence: true, length: { maximum: 65 }
  validates :content,     presence: true
  validates :description, presence: true

  has_one :thumbnail, as: :assetable, dependent: :destroy
  accepts_nested_attributes_for :thumbnail
  has_many :comments, as: :commentable, dependent: :delete_all
end

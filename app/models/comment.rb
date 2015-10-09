# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  author_name      :string
#  content          :text
#  commentable_id   :integer
#  commentable_type :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true

  validates :author_name, length: { maximum: 65 }
  validates :content, presence: true
  validates :commentable_type, inclusion: { in: %w(Article Post) }
end

# == Schema Information
#
# Table name: content_views
#
#  id          :integer
#  title       :string
#  type        :text
#  author_name :string
#  description :text
#  tag_ids     :integer          is an Array
#  created_at  :datetime
#  updated_at  :datetime
#

class ContentView < ActiveRecord::Base
  self.table_name = 'content_views'

  scope :any_tags, -> (tags) { where('tag_ids && ARRAY[?]', Array.wrap(tags).map(&:to_i)) }
  scope :recently, -> { order(created_at: :desc) }

  def readonly?
    true
  end
end

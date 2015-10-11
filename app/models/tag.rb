# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string(45)
#  slug       :string(45)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tag < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true, length: { maximum: 45 }
  validates :slug, presence: true, uniqueness: true, length: { maximum: 45 }

  def to_param
    name
  end
end

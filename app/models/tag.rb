class Tag < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true, length: { maximum: 45 }
  validates :slug, presence: true, uniqueness: true, length: { maximum: 45 }

  def to_param
    slug
  end
end

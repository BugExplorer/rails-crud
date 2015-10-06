class Tag < ActiveRecord::Base
  def to_param
    slug
  end
end

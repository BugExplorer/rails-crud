# == Schema Information
#
# Table name: assets
#
#  id             :integer          not null, primary key
#  filename       :string(45)
#  assetable_id   :integer
#  assetable_type :string
#  type           :string(30)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Thumbnail < Asset
  mount_uploader :data, ThumbnailUploader, mount_on: :filename
end

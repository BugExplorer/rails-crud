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

  validate :thumbnail_size

  private

    def thumbnail_size
      if data.file.size > 2.megabytes
        errors.add(:data, 'should be less than 2MB')
      end
    end
end

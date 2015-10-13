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

class Picture < Asset
  mount_uploader :data, PictureUploader, mount_on: :filename

  validate :picture_size

  private

    def picture_size
      if data.file.size > 10.megabytes
        errors.add(:data, 'should be less than 10MB')
      end
    end
end

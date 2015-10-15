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

class Asset < ActiveRecord::Base
  belongs_to :assetable, polymorphic: true

  validate :filename_length

  private

    def filename_length
      if data.file.filename.length > 45
        errors.add(:data, 'filename should be less than 45 characters')
      end
    end
end

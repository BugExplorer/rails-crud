class Thumbnail < Asset
  mount_uploader :data, ThumbnailUploader, mount_on: :filename
end

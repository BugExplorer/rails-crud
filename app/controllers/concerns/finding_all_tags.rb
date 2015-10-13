module FindingAllTags
  extend ActiveSupport::Concern

  included do
    before_action :get_all_tags, only: [:new, :create, :edit, :update]
  end

  def get_all_tags
    @tags = Tag.all
  end
end

module FindingAllTags
  extend ActiveSupport::Concern

  included do
    before_action :all_tags
  end

  def all_tags
    @tags = Tag.all
  end
end

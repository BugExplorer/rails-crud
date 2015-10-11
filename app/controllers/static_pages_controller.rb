class StaticPagesController < ApplicationController
  before_action :get_all_tags

  def home
    @entries = [] # Array of hashes
    @tags.each do |tag|
      # Get entries count of the current tag
      tag_entries_count = ContentView.any_tags(tag.id).count
      # Get current tag's font size
      _class =
        case tag_entries_count
        when 0..15 then 'sm'
        when 16..20 then 'nm'
        else 'big'
        end

      @entries << { tag: tag, css_class: _class }
    end
  end

  private
    def get_all_tags
      @tags = Tag.all
    end
end

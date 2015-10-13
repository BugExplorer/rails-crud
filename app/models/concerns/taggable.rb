module Taggable
  extend ActiveSupport::Concern

  def self.any_tags(tags)
    where('tag_ids && ARRAY[?]', Array.wrap(tags).map(&:to_i))
  end

  def self.all_tags(tags)
    where('tag_ids @> ARRAY[?]', Array.wrap(tags).map(&:to_i))
  end

  def tag_ids=(value)
    ids = Array.wrap(value).select do |v|
      !v.blank? && v.to_i != 0
    end

    ids.map!(&:to_i)

    write_attribute(:tag_ids, ids)
  end
end

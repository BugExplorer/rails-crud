class AddTagsToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :tag_ids, :integer, array: true, default: []
    add_index  :articles, :tag_ids, using: 'gin'
  end
end

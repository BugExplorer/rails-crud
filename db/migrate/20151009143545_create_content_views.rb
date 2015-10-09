class CreateContentViews < ActiveRecord::Migration
  def up
    execute("
      CREATE OR REPLACE VIEW content_views AS
        SELECT id, title, 'Post' AS type, author_name, NULL as description, tag_ids, created_at, updated_at FROM posts
        UNION
        SELECT id, title, 'Article' AS type, author_name, description, tag_ids, created_at, updated_at FROM articles
    ")
  end

  def down
    execute("DROP VIEW content_views;")
  end
end

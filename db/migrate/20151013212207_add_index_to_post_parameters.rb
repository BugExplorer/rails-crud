class AddIndexToPostParameters < ActiveRecord::Migration
  def up
    add_index :posts, [:parameters], name: "posts_gin_parameters", using: :gin
  end

  def down
    remove_index :posts, name: "posts_gin_parameters"
  end
end

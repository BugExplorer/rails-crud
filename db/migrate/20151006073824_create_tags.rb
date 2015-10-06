class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name, limit: 45
      t.string :slug, limit: 45
      t.timestamps null: false
    end
  end
end

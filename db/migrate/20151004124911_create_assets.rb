class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string   :filename, :limit => 45
      t.integer  :assetable_id
      t.string   :assetable_type
      t.string   :type, :limit => 30
      t.timestamps null: false
    end
    add_index :assets, [:assetable_id, :assetable_type]
    add_index :assets, :type
  end
end

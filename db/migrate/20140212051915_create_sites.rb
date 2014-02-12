class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :url, null: false
      t.string :token, null: false

      t.timestamps
    end
    add_index :sites, :token, unique: true
  end
end

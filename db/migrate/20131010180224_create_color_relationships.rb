class CreateColorRelationships < ActiveRecord::Migration
  def change
    create_table :color_relationships do |t|
      t.integer :color_id
      t.integer :address_id

      t.timestamps
    end
  end
end

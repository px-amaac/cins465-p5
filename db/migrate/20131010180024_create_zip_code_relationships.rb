class CreateZipCodeRelationships < ActiveRecord::Migration
  def change
    create_table :zip_code_relationships do |t|
      t.integer :zip_code_id
      t.integer :address_id

      t.timestamps
    end
  end
end

class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :firstName
      t.string :lastName
      t.string :email
      t.integer :zipCode
      t.string :favoriteColor

      t.timestamps
    end
  end
end

class RemoveZipCodeFromAddress < ActiveRecord::Migration
  def change
    remove_column :addresses, :zipCode, :string
    remove_column :addresses, :favoriteColor, :string
  end
end

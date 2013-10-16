class RemoveZipCodeFromAddress < ActiveRecord::Migration
  def change
    remove_column :addresses, :zipCode, :string
  end
end

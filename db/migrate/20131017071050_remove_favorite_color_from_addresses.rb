class RemoveFavoriteColorFromAddresses < ActiveRecord::Migration
  def change
    remove_column :addresses, :favoriteColor, :string
  end
end

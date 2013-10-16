class RemoveColorFromAddresses < ActiveRecord::Migration
  def change
    remove_column :addresses, :color, :string
  end
end

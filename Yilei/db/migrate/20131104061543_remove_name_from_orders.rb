class RemoveNameFromOrders < ActiveRecord::Migration
  def up
  end

  def down
  end
	
	def change
		remove_column :orders, :name
	end
end

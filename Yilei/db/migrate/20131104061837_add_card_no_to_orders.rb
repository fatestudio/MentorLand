class AddCardNoToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :card_no, :string
  end
end

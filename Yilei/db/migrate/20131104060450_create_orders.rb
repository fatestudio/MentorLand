class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.integer :month
      t.integer :year
      t.string :first_name
      t.string :last_name
      t.string :billing_address
      t.string :verification_value

      t.timestamps
    end
  end
end

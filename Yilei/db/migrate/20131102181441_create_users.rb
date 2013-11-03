class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.string :credit_card_no
      t.integer :credit_card_month
      t.integer :credit_card_year
      t.string :credit_card_verification_value
      t.string :credit_card_billing_address
      t.string :credit_card_type

      t.timestamps
    end
  end
end

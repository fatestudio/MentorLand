class AddNewUserTypes < ActiveRecord::Migration
  def change
    create_table(:enrollments, :id => false) do |t|
      t.references :user
      t.references :course

      t.timestamps
    end

  end
end

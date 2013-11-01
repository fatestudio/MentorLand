class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :description
      t.decimal :price
      t.integer :capacity
      t.string :time
      t.string :location

      t.timestamps
    end
  end
end

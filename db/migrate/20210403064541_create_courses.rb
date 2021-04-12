class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      
      t.string :name
      t.text :description
      t.integer :level
      t.string :day
      t.time :time
      t.integer :duration
      t.decimal :price
      t.timestamps

      t.integer :teacher_id
    end
  end
end

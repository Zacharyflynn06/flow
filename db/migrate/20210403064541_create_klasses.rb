class CreateKlasses < ActiveRecord::Migration[6.1]
  def change
    create_table :klasses do |t|
      t.string :name
      t.text :description
      t.integer :level
      t.string :day
      t.time :time 
      t.integer :duration
      t.decimal :price

      t.references :student, foreign_key: true
      t.references :teacher, foreign_key: true

      t.timestamps
    end
  end
end

class CreateKlasses < ActiveRecord::Migration[6.1]
  def change
    create_table :klasses do |t|
      t.string :name
      t.text :description
      t.integer :level
      t.date :date
      t.time :time 
      t.integer :length
      t.integer :price

      t.references :student, foreign_key: true
      t.references :teacher, foreign_key: true

      t.timestamps
    end
  end
end

class CreateKlasses < ActiveRecord::Migration[6.1]
  def change
    create_table :klasses do |t|

      t.date :date
      t.time :time 
      t.integer :length
      t.integer :price

      t.references :student, null: false, foreign_key: true
      t.references :teacher, null: false, foreign_key: true

      t.timestamps
    end
  end
end

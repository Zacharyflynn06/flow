class CreateTeachers < ActiveRecord::Migration[6.1]
  def change
    create_table :teachers do |t|

      
      t.string :first_name
      t.string :last_name
      t.integer :years_experience
      t.text :bio
      t.boolean :admin

      t.timestamps
    end
  end
end

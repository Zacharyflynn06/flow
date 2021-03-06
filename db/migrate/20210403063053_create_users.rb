class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|

      t.string :email
      t.string :username
      t.string :first_name
      t.string :last_name
      t.integer :years_experience
      t.text :bio
      t.integer :role
      t.string :password_digest
      t.string :uid 
      t.string :provider

      t.timestamps
    end
  end
end

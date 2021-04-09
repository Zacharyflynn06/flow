class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|

      t.references :student, null: false, foreign_key: {to_table: :users}
      t.references :course, null: false, foreign_key: true
      
      t.integer :rating
      t.text :content

      t.timestamps
    end
  end
end

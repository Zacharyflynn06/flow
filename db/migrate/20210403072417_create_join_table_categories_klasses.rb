class CreateJoinTableCategoriesKlasses < ActiveRecord::Migration[6.1]
  def change
    create_join_table :categories, :klasses do |t|
      t.index [:category_id, :klass_id]
      t.index [:klass_id, :category_id]
    end
  end
end

class CreateStudentTeachers < ActiveRecord::Migration[6.1]
  def change
    create_table :student_teachers do |t|
      t.references :student, null: false, foreign_key: {to_table: :users}
      t.references :teacher, null: false, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end

class CreateStudentTeachers < ActiveRecord::Migration[6.1]
  def change
    create_table :student_teachers do |t|
      t.references :student, null: false, foreign_key: true
      t.references :teacher, null: false, foreign_key: true

      t.timestamps
    end
  end
end

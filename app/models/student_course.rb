class StudentCourse < ApplicationRecord
  belongs_to :student, class_name: "User"
  belongs_to :course
end

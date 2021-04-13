class User < ApplicationRecord

#students
    has_many :student_courses, foreign_key: :student_id
    has_many :courses, through: :student_courses, source: :course
    has_many :student_teachers, foreign_key: :student_id
    has_many :teachers, -> {where("users.role = ?", User.roles[:teacher])}, through: :student_teachers, source: :teacher
    has_many :submitted_reviews, foreign_key: "student_id", class_name: "Review"

# teacher
    has_many :given_courses, foreign_key: :teacher_id, class_name: "Course"
    has_many :teacher_students, class_name: "StudentTeacher", foreign_key: :teacher_id
    has_many :students, -> {where("users.role = ?", User.roles[:student])}, through: :teacher_students, source: :student
    has_many :reviews, through: :given_courses

    enum role: [:student, :teacher, :admin]

    has_secure_password
    validates :username, uniqueness: true
    validates :bio, presence: true, if: lambda { self.role.to_s == 'teacher' }
    validates :years_experience, presence: true, if: lambda { self.role.to_s == 'teacher' }

    # validates :first_name, presence: true
    # validates :last_name, presence: true

    def full_name
        self.first_name.capitalize + " " + self.last_name.capitalize
    end
end

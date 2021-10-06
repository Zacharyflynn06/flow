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

    has_one_attached :avatar

    enum role: [:student, :teacher, :admin]
    
    validates :username, presence: true, uniqueness: true
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: true 
    validates :bio, presence: true
    validates :years_experience, presence: true, if: lambda { self.role.to_s == 'teacher' }
    
    has_secure_password

    def self.from_omniauth(response)
        User.find_or_create_by(uid: response[:uid], provider: response[:provider]) do |u|
            u.first_name = response[:info][:first_name]
            u.last_name = response[:info][:last_name]
            u.username = response[:info][:name]
            u.email = response[:info][:email]
            u.password = SecureRandom.hex(15)
            u.role = "student"
            u.bio = "Update this bio later!"
        end
    end

    def full_name
        self.first_name.capitalize + " " + self.last_name.capitalize
    end
end

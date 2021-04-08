class User < ApplicationRecord

    has_many :given_klasses, foreign_key: :teacher_id, class_name: "Klass"
    has_many :taken_klasses, foreign_key: :student_id, class_name: "Klass"


    has_many :teachers, -> {where("users.role = ?", User.roles[:teacher])}, through: :taken_klasses, source: :teacher
    has_many :students, -> {where("users.role = ?", User.roles[:student])}, through: :given_klasses, source: :student

    enum role: [:student, :teacher, :admin]

    has_secure_password

    validates :first_name, presence: true
    validates :last_name, presence: true

    
    def full_name
        self.first_name.capitalize + " " + self.last_name.capitalize
    end
end

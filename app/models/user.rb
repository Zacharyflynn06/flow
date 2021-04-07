class User < ApplicationRecord

    has_many :klasses, foreign_key: :user_id

    has_many :teachers, -> {where("user.role = ?", User.roles[:student])}, through: :klasses, source: :teacher
    has_many :students, -> {where("user.role = ?", User.roles[:teacher])}, through: :klasses, source: :student

    enum role: [:student, :teacher, :admin]

    has_secure_password

    # validates :first_name, presence: true
    # validates :last_name, presence: true

    
    def full_name
        self.first_name + " " + self.last_name
    end
end

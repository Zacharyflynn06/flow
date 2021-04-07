# class Student < ApplicationRecord

#     has_many :klasses
#     has_many :teachers, :through => :klasses

#     validates :first_name, presence: true
#     validates :last_name, presence: true
#     validates :bio, presence: true
#     validates :years_experience, numericality: true

#     enum role: [:teacher, :student, :admin]

#     def full_name
#         self.first_name + " " + self.last_name
#     end
# end

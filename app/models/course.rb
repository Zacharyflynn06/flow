class Course < ApplicationRecord


  belongs_to :student, class_name: "User", optional: true
  belongs_to :teacher, class_name: "User"

  has_many :reviews
  # has_many :students, through: :reviews, class_name: "User"

  # validates :name, presence: true
  # validates :day, presence: true, inclusion: %w(Sunday Monday Tuesday Wednesday Thursday Friday Saturday Sunday)
  # validates :time, presence: true
  # validates :duration, presence: true, inclusion: %w(30 60 90)
  # validates :price, presence: true

end

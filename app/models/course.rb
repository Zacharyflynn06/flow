class Course < ApplicationRecord

  has_many :reviews
  has_many :student_courses
  has_many :students, through: :student_courses
  belongs_to :teacher, class_name: "User"
  has_many :students, through: :reviews, class_name: "User"

  # validates :name, presence: true
  # validates :day, presence: true, inclusion: %w(Sunday Monday Tuesday Wednesday Thursday Friday Saturday Sunday)
  # validates :time, presence: true
  validate :check_duration
  # validates :price, presence: true, numericality: { greater_than: 0}, :format => { :with => /^\d{1,6}(\.\d{0,2})?$/ }


  def check_duration
    if ![30, 60, 90].include?(self.duration)
      self.errors.add(:duration, "Has to be 30 60 90")
    end
  end
end

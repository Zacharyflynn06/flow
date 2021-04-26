class Course < ApplicationRecord

  has_many :reviews
  has_many :student_courses
  has_many :students, through: :student_courses
  belongs_to :teacher, class_name: "User"
  has_many :students, through: :reviews, class_name: "User"

  validates :name, presence: true
  validates :day, presence: true, inclusion: %w(Sunday Monday Tuesday Wednesday Thursday Friday Saturday Sunday)
  validates :time, presence: true
  validate :check_duration
  validates :price, presence: true, numericality: { greater_than: 0}
  
  # scope :filter_by_level, -> (level) {where(level: level)}
  # scope :alphabetically, -> {order(name: :desc)}
  # scope :recent, -> { order(:created_at, :desc) }
  scope :filter_by_level, -> (filter) {where("level = ?", filter)}

  def check_duration
    if ![30, 60, 90].include?(self.duration)
      self.errors.add(:duration, "Has to be 30 60 90")
    end  
  end  

  def standard_time
    self.time.try(:strftime, "at %I:%M %P") || "Time has not been set"
  end

end

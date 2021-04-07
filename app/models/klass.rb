class Klass < ApplicationRecord
  has_many :students
  belongs_to :teacher, optional: true

  validates :name, presence: :true
  # validates :day, #presence: :true
  # validates :time, #presence: :true, numericallity: :true
  # validates :length, #presence: :true, numericallity: :true

  def standard_time
    self.time.strftime("%I:%M %P")
  end
end

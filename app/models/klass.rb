class Klass < ApplicationRecord
  has_many :students
  belongs_to :teacher, optional: true

  validates :name, presence: :true
  # validates :date, #presence: :true
  # validates :time, #presence: :true, numericallity: :true
  # validates :length, #presence: :true, numericallity: :true
end

class Klass < ApplicationRecord
  belongs_to :student
  belongs_to :teacher

  # validates :name, presence: :true
  # validates :date, #presence: :true
  # validates :time, #presence: :true, numericallity: :true
  # validates :length, #presence: :true, numericallity: :true
end

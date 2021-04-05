class Klass < ApplicationRecord
  belongs_to :student
  belongs_to :teacher
  has_and_belongs_to_many :categories

  validates :name, prsence: :true
  validates :date, presence: :true
  validates :time, presence: :true, numericallity: :true
  validates :length, presence: :true, numericallity: :true
end

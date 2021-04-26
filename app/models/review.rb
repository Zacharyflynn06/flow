class Review < ApplicationRecord
  belongs_to :course
  belongs_to :student, class_name: "User"
  
  validates :content, presence: true
  validates :rating, presence: true


end

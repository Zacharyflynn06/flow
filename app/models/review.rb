class Review < ApplicationRecord
  belongs_to :klass
  belongs_to :student, class_name: "User"
  
end

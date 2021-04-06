class Teacher < ApplicationRecord

    has_many :klasses
    has_many :students, :through => :klasses

    validates :first_name, presence: true
    
    
end

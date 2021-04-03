class Teacher < ApplicationRecord

    has_many :klasses
    has_many :students, :through => :klasses
    
end

class Student < ApplicationRecord

    has_many :klasses
    has_many :teachers, :through => :klasses

 
    


end

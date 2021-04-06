class Student < ApplicationRecord

    has_many :klasses
    has_many :teachers, :through => :klasses

    def full_name
        self.first_name + " " + self.last_name
    end
end

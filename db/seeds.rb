# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Student.create([{first_name: "Rip", last_name: "Hebron"},{first_name: "Lane", last_name: "Mitchell"},{first_name: "Justin", last_name: "Neely"}, {first_name: "Tanner", last_name: "Bardin"}])


Teacher.create(first_name: "Alex", last_name: "Cazet", bio: "I love teaching yoga and playing saxaphone!", years_experience: 3)
Teacher.create(first_name: "Genevieve", last_name: "Truckey", bio: "I teach yoga and love cats!", years_experience: 2)
Teacher.create(first_name: "Johnny", last_name: "Bosbyshell", bio: "I play keybaords and love to do yoga!", years_experience: 1)

Klass.create(teacher_id: 3, name: "Yoga for Beginners", level: 1, description: "Intro level yoga for those who have never done yoga.")
Klass.create(teacher_id: 2, name: "Intermediate Yoga", level: 2, description:"Yoga for those who can do a vinyasa")
Klass.create(teacher_id: 1, name: "Advanced Yoga", level:3, description: "Yoga for those who have mastered Intermediate Yoga")
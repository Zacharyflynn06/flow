# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Student.create([{first_name: "Rip", last_name: "Hebron"},{first_name: "Lane", last_name: "Mitchell"}])
Teacher.create([{first_name: "Alex", last_name: "Cazet"},{first_name: "Genevieve", last_name: "Truckey"}])
Klass.create(teacher_id: 1, name: "Yoga for Beginners", level: 1, description: "Intro level yoga for those who have never done yoga.")
Klass.create(teacher_id: 2, name: "Intermediate Yoga", level: 2, description:"Yoga for those who can do a vinyasa")
Klass.create(teacher_id: 2, name: "Advanced Yoga", level:3, description: "Yoga for those who have mastered Intermediate Yoga")
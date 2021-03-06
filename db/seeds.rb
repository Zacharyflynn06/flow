# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# students
User.create(role: 0, email: "rip@h.com", username: "riph", password: "password", first_name: "Rip", last_name: "Hebron")
User.create(role: 0, email: "lane@m.com", username: "lanem", password: "password", first_name: "Lane", last_name: "Mitchell")
User.create(role: 0, email: "justin@n.com", username: "justinn", password: "password", first_name: "Justin", last_name: "Neely")
User.create(role: 0, email: "tanner@b.com", username: "tannerb", password: "password", first_name: "Tanner", last_name: "Bardin")
 
# teachers
User.create(role: 1, email: "alex@c.com", username: "alexc", password: "password", first_name: "Alex", last_name: "Cazet", bio: "I love teaching yoga and playing saxaphone!", years_experience: 3)
User.create(role: 1, email: "gen@t.com", username: "gent", password: "password", first_name: "Genevieve", last_name: "Truckey", bio: "I teach yoga and love cats!", years_experience: 2)
User.create(role: 1, email: "johnny@b.com", username: "johnnyb", password: "password", first_name: "Johnny", last_name: "Bosbyshell", bio: "I play keybaords and love to do yoga!", years_experience: 1)

# admin
User.create(role: 2, email: "zac@f.com", username: "zacf", password: "password", first_name: "Zac", last_name: "Flynn", bio: "I'm the admin")

# classes
Course.create(teacher_id: 5, name: "Yoga for Beginners", level: 1, description: "Intro level yoga for those who have never done yoga.", price: 12.00, duration: 30, day: "Monday", time: "03:00 PM")
Course.create(teacher_id: 6, name: "Intermediate Yoga", level: 2, description:"Yoga for those who can do a vinyasa", price: 12.00, duration: 60, day: "Tuesday", time: "10:00 AM" )
Course.create(teacher_id: 7, name: "Advanced Yoga", level:3, description: "Yoga for those who have mastered Intermediate Yoga", price: 20.00, duration: 90, day: "Wednesday", time: "03:00 PM" )
Course.create(teacher_id: 5, name: "Pranayama 101", level:1, description: "Intro to breathwork", price: 20.00, duration: 30, day:"Thursday", time: "10:00 AM" )
Course.create(teacher_id: 6, name: "Advanced Pranayama", level:1, description: "Advanced breathing practice", price: 20.00, duration: 30, day:"Wednesday", time: "06:00 PM" )
Course.create(teacher_id: 7, name: "Aquatic Yoga", level:3, description: "This is where you learn how to do Yoga in the pool", price: 20.00, duration: 30, day:"Sunday", time: "03:00 PM" )
Course.create(teacher_id: 5, name: "Flying Yoga", level:3, description: "In flying yoga, we will do yoga while skydiving", price: 200.00, duration: 90, day:"Friday", time: "09:00 AM" )
Course.create(teacher_id: 6, name: "Yoga for Instagram", level:3, description: "This is where you learn how to take good yoga selfies for the grid", price: 200.00, duration: 90, day:"Saturday", time: "02:00 PM" )

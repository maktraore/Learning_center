# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 20.times do 
#   Employee.create(
#     full_name: Faker::Name.name,
#     email:  Faker::Internet.email,
#     phone_number:  Faker::PhoneNumber.cell_phone,
#     bio: Faker::Hipster.paragraphs,
#     approved: true
#     )
# end

# 15.times do 
#   Subject.create(
#     name: Faker::Educator.course,
#     department:  Faker::Educator.campus
#     )
# end

# emp = (1..50).to_a
# subject = (1..15).to_a

# 20.times do 
#   EmployeeSubject.create(
#         employee_id: Employee.all.sample.id,
#         subject_id: Subject.all.sample.id
#         )
# end
# Timeslot.create(start_time:"12:00pm",end_time:"5:00pm",semester:"Summer",days:"Mondays", location_id: Location.all.sample.id)
# Location.create(name:"Online", address:"Online",phone_number:"1234567890")
# # EmployeeSubject.all.where("id> ?", 10).destroy_all
# Employee.all.each do |e|
#   CampusEmployee.create(employee_id: e.id, location_id: Location.pluck(:id).sample)
#   CampusEmployee.create(employee_id: e.id, location_id: Location.pluck(:id).sample)
# end
# Employee.all.each do |e|
#   EmployeeSubject.create(employee_id: e.id, subject_id: Subject.pluck(:id).sample, courses_tutored: "Math116 Math105")
#   EmployeeSubject.create(employee_id: e.id, subject_id: Subject.pluck(:id).sample)
# end
# # CampusEmployee.destroy_all
# Employee.all.each do |e|
#   timeslots = Timeslot.pluck(:id).shuffle
#   EmployeeTimeSlot.create(employee_id: e.id, timeslot_id: timeslots.pop)
#   EmployeeTimeSlot.create(employee_id: e.id, timeslot_id: timeslots.pop)
# end
# Subject.all.each do |e|
#   CampusSubject.create!(location_id: Location.pluck(:id).sample, subject_id: e.id)
#   CampusSubject.create!(location_id: Location.pluck(:id).sample, subject_id: e.id)
#  end
#  5.times do 
#   Subject.create(department: Math)
#  end
# User.create(name:  "student6",
#              email: "student6@gmail.com",
#              password:              "password",
#              password_confirmation: "password",
#              activated: true,
#              activated_at: Time.zone.now)

# 6.upto(10) do |n|
#   name  = "student"+n.to_s
#   email = "student#{n}@gmail.com"
#   password = "password"
#   User.create(name:  name,
#               email: email,
#               password:  password,
#               password_confirmation: password,
#               activated: true,
#               activated_at: Time.zone.now)
# end

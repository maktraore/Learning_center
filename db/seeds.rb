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

20.times do 
  # EmployeeSubject.create(
  #       employee_id: Employee.all.sample.id,
  #       subject_id: Subject.all.sample.id
  #       )
Timeslot.create(start_time:"12:00pm",end_time:"5:00pm",semester:"Summer",days:"Mondays", location_id: Location.all.sample.id)
end
# Location.create(name:"Online", address:"Online",phone_number:"1234567890")
# # EmployeeSubject.all.where("id> ?", 10).destroy_all
Employee.all.each do |e|
  CampusEmployee.create(employee_id: e.id, location_id: Location.pluck(:id).sample)
  CampusEmployee.create(employee_id: e.id, location_id: Location.pluck(:id).sample)
end
Employee.all.each do |e|
  EmployeeSubject.create(employee_id: e.id, subject_id: Subject.pluck(:id).sample, courses_tutored: "Math116 Math105")
  EmployeeSubject.create(employee_id: e.id, subject_id: Subject.pluck(:id).sample)
end
# # CampusEmployee.destroy_all
Employee.all.each do |e|
  timeslots = Timeslot.pluck(:id).shuffle
  EmployeeTimeSlot.create(employee_id: e.id, timeslot_id: timeslots.pop)
  EmployeeTimeSlot.create(employee_id: e.id, timeslot_id: timeslots.pop)
end
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
# Subject.create!([
#   {name: nil, department: "Math"},
#   {name: nil, department: "Psychology"},
#   {name: nil, department: "Science"},
#   {name: nil, department: "Writing"},
#   {name: nil, department: "Gen Ed"}
# ])
# Location.create!([
#   {name: "Manhattan", address: "66 W 35th St, New York, NY 10016", phone_number: "2126153349"},
#   {name: "Bronx", address: "1200 Waters Pl, Bronx, NY 10461", phone_number: "7186788905"},
#   {name: "Dobbs Ferry", address: "555 Broadway, Dobbs Ferry, NY 10522", phone_number: "9146747402"},
#   {name: "Online", address: "Online", phone_number: "1234567890"},
#   {name: "York Town", address: "2651 Strang Blvd, Yorktown Heights, NY 10598", phone_number: "2123345708"}
# ])
# Employee.create!([
#   {full_name: "Masele Kibassa", email: "masele@gmail.com", phone_number: "727828782", bio: "something", admin: false, password_digest: "$2a$10$/59Xk5DLdS3KT2kkRJhdLOgn2FR7Sae3U0yRigG3UxLrwhZfAsbYy", approved: true, activation_digest: nil, activated: false, activated_at: nil, remember_digest: nil, reset_digest: nil, reset_sent_at: nil},
#   {full_name: "seyba", email: "seyba@gmail.com", phone_number: "3289848448", bio: "just about me", admin: false, password_digest: "$2a$10$zlcID56DSIFIFxl1Fiw0Te2Tct82pt0Qm9hVPcOlGYAIYPOpDpQVW", approved: false, activation_digest: nil, activated: false, activated_at: nil, remember_digest: nil, reset_digest: nil, reset_sent_at: nil},
#   {full_name: "Mamadou Traore", email: "newamericanrealty.seyba@gmail.com", phone_number: "9176006808", bio: "Ugh try-hard direct trade tattooed waistcoat tote bag ramps franzen lo-fi scenester migas taiyaki lyft tumblr mumblecore. Succulents street art pok pok actually four dollar toast craft beer locavore master cleanse intelligentsia. Roof party butcher cornhole post-ironic mlkshk, pour-over slow-carb tacos scenester VHS pinterest shaman cloud bread. Pop-up flannel aesthetic, farm-to-table mustache polaroid poke church-key listicle shaman forage. Beard vaporware distillery four dollar toast YOLO sartorial. Seitan keytar gastropub, ethical chicharrones cloud bread DIY banjo lomo live-edge narwhal meggings chia PBR&B. Heirloom artisan freegan affogato pork belly iPhone fashion axe you probably haven't heard of them ethical sartorial post-ironic. Messenger bag occupy paleo, viral crucifix kogi hexagon tumeric shaman shoreditch forage succulents heirloom keffiyeh. Meditation taxidermy raw denim actually truffaut. Irony bitters swag, jean shorts photo booth selfies twee kogi roof party waistcoat authentic tumblr chambray lomo. Shoreditch gluten-free hot chicken kogi, pinterest migas franzen DIY tacos. Cronut actually fingerstache fixie post-ironic marfa cardigan pork belly salvia meditation adaptogen yr polaroid. Man braid venmo mumblecore, mixtape humblebrag adaptogen gentrify skateboard activated charcoal VHS lumbersexual street art edison bulb.", admin: true, password_digest: "$2a$10$qnCGr9FXTkDqVopGQKQmzOwftrOcMj9uQG/rSEsvz2uDmSZ2dXcpC", approved: true, activation_digest: nil, activated: false, activated_at: nil, remember_digest: nil, reset_digest: nil, reset_sent_at: nil},
#   {full_name: "Maria Mordan", email: "maria@gmail.com", phone_number: "390949455", bio: "new bio", admin: true, password_digest: "$2a$10$WOPJfEkMETBkj8H1XrFrS.lW1U2kHgzPOdyfEWVwo.bfE86KiIAoK", approved: true, activation_digest: nil, activated: false, activated_at: nil, remember_digest: nil, reset_digest: nil, reset_sent_at: nil},
#   {full_name: "rochelle", email: "rochelle@gmail.com", phone_number: "", bio: "", admin: false, password_digest: "$2a$10$Vnykm9pHgS5zMvJIYm5Ayu4Cd6yRcUgHfsUa0QW2seK9ZjUug8QXm", approved: true, activation_digest: nil, activated: false, activated_at: nil, remember_digest: nil, reset_digest: nil, reset_sent_at: nil},
#   {full_name: "Peter Alvino", email: "peter@gmail.com", phone_number: "4904394909", bio: "fdokfdgf", admin: false, password_digest: "$2a$10$zSmBE1BIAcPsj64G6fK3cO7qt86DZHSkWN42weC9WDJBPEAozbBdm", approved: true, activation_digest: nil, activated: false, activated_at: nil, remember_digest: nil, reset_digest: nil, reset_sent_at: nil},
#   {full_name: "Cristian Lucio", email: "christian@gmail.com", phone_number: "9176006808", bio: "about him", admin: false, password_digest: "$2a$10$qnCGr9FXTkDqVopGQKQmzOwftrOcMj9uQG/rSEsvz2uDmSZ2dXcpC", approved: true, activation_digest: nil, activated: false, activated_at: nil, remember_digest: nil, reset_digest: nil, reset_sent_at: nil},
#   {full_name: "Juli Charks", email: "juli@gmail.com", phone_number: "3929490595", bio: "bio1 jkjsajkdkd dkdkdkkd\r\ngsfu", admin: false, password_digest: "$2a$10$Xef/GpmREGdDP59mHbCuYOM9UY921ijdvYFS9u1t/RNNw5arnXLF6", approved: true, activation_digest: nil, activated: false, activated_at: nil, remember_digest: nil, reset_digest: nil, reset_sent_at: nil},
#   {full_name: "Irene", email: "irene@gmail.com", phone_number: "32673773673", bio: "my bio", admin: false, password_digest: "$2a$10$P9L3E9NMbBH.PNsZQZ0HUOXQJjcUttxs9OjGQ.l5a3Nw8yoooTj0O", approved: false, activation_digest: nil, activated: false, activated_at: nil, remember_digest: nil, reset_digest: nil, reset_sent_at: nil},
#   {full_name: "Brain Cool", email: "brain@gmail.com", phone_number: "378483844", bio: "reffdnbfhf", admin: nil, password_digest: "$2a$10$aRBgfDNKPsrE3Lv6epqiXO99M.866vsTEgd9WH6yCim5Jghq5PCD.", approved: false, activation_digest: nil, activated: false, activated_at: nil, remember_digest: nil, reset_digest: nil, reset_sent_at: nil},
#   {full_name: "Cindy Johnson", email: "cindy@gmail.com", phone_number: "32889439848", bio: "Hello", admin: nil, password_digest: "$2a$10$lNy7QENPT306ewHlP5CDGeAPXdYw9cDgF2/FbM64fYY3AqNyon4Su", approved: false, activation_digest: nil, activated: false, activated_at: nil, remember_digest: nil, reset_digest: nil, reset_sent_at: nil}
# ])
# User.create!([
#   {name: "student3", email: "student3@gmail.com", password_digest: "$2a$10$hL8yj5CJPm4oTGwFz1rbjOqiAn70gBje9DtFr9goI/rtB2SOr8VpS", activation_digest: nil, activated: false, activated_at: nil, remember_digest: nil, reset_digest: nil, reset_sent_at: nil},
#   {name: "student2", email: "student2@gmail.com", password_digest: "$2a$10$hL8yj5CJPm4oTGwFz1rbjOqiAn70gBje9DtFr9goI/rtB2SOr8VpS", activation_digest: nil, activated: false, activated_at: nil, remember_digest: nil, reset_digest: nil, reset_sent_at: nil},
#   {name: "student4", email: "student4@gmail.com", password_digest: "$2a$10$b0VDiTT5d2CkaE.kR4zaoe5CdaJnLiBnNdVQ1EsOAOdUKtXBl/rkO", activation_digest: nil, activated: false, activated_at: nil, remember_digest: nil, reset_digest: nil, reset_sent_at: nil},
#   {name: "student5", email: "student5@gmail.com", password_digest: "$2a$10$WoGJ4JViGzXL0aDsdb1vAuwrcH5rCXoy4MOfN89RC4MElLJZHQSQy", activation_digest: nil, activated: false, activated_at: nil, remember_digest: nil, reset_digest: nil, reset_sent_at: nil},
#   {name: "student6", email: "student6@gmail.com", password_digest: "$2a$10$UUZ03g.7wtZf2qBtPeDbeezFo4Yg/yi55RrkSCaDQ8YplobJHtFAe", activation_digest: "$2a$10$Zh30niLggXeA6r4SjUDUxOM.MXQxxewxPXkJ5QF3rpgfyEqmmrURa", activated: true, activated_at: "2017-07-24 12:30:17", remember_digest: nil, reset_digest: nil, reset_sent_at: nil},
#   {name: "student7", email: "student7@gmail.com", password_digest: "$2a$10$hHh2lNpy0dqDWm5uVllZCOET4VubPevv9gcsPgunCGBJtqcI9VXzO", activation_digest: "$2a$10$6ApAjr8sHQ5FihQGOaHQnOq3t.1IJsTbpKbHmHQBp7VJ2u3xAXxMe", activated: true, activated_at: "2017-07-24 12:30:18", remember_digest: nil, reset_digest: nil, reset_sent_at: nil},
#   {name: "student8", email: "student8@gmail.com", password_digest: "$2a$10$hKt3s.655pkTzo.WtxP4aez5I6iINBlZS4pYOn3aNbRrw4/m8.K3K", activation_digest: "$2a$10$EGXxCSV/jfizHl60X8Ggq.rYEj.B2xcVXZvQ1QlnbUmYqCC9RPABe", activated: true, activated_at: "2017-07-24 12:30:18", remember_digest: nil, reset_digest: nil, reset_sent_at: nil},
#   {name: "student9", email: "student9@gmail.com", password_digest: "$2a$10$nJIg31emaZN6DoDxMQfKA.D.ilg.ZEmAZXMEChrs4TKmvpHjVwGBe", activation_digest: "$2a$10$ijEKk/wrONmS/WSaInkF7eln1Fg6Ks7T/p/MyPcG6jNXOFILqrA7C", activated: true, activated_at: "2017-07-24 12:30:18", remember_digest: nil, reset_digest: nil, reset_sent_at: nil},
#   {name: "student10", email: "student10@gmail.com", password_digest: "$2a$10$tUGa5g1pXMBK8jgW.5p4mexVKJTsYopGLczrAAl6bDwl6guFY2.qO", activation_digest: "$2a$10$UaCsn0TFu7qLUP6Lfnh2c.Mwi.zSs6RGhYqq0gJtXpeD1fENOd5/6", activated: true, activated_at: "2017-07-24 12:30:18", remember_digest: nil, reset_digest: nil, reset_sent_at: nil},
#   {name: "student11", email: "student11@gmail.com", password_digest: "$2a$10$iDBH5RvHVDjUMk7fDlPz9.UWc3nLwdAEb47cdzAelshhrTD29liny", activation_digest: "$2a$10$X809t2r1hggQ8ijYnrHk6e2ZYm8EUqWZwGWxH3MRlFtseoiq64g/u", activated: false, activated_at: nil, remember_digest: nil, reset_digest: nil, reset_sent_at: nil},
#   {name: "student12", email: "student12@gmail.com", password_digest: "$2a$10$qOhVt.x6EU/dtV/9gOwxOen.dFovqRu//5bimZUIqj13woNLx0lDO", activation_digest: "$2a$10$AUmTcGvba1iPmXa57SoAlOzcUGhBdoFRlcSuoMj7AqpOQlU7OSiqy", activated: false, activated_at: nil, remember_digest: nil, reset_digest: nil, reset_sent_at: nil},
#   {name: "student13", email: "student13@gmail.com", password_digest: "$2a$10$uDu79ecOJR/DXxifKWfWo.NdlMz7uA1I7Cb7vPFW05bRbiUq8g0Hi", activation_digest: "$2a$10$IM04lCfmD6zu8jgoXyyOqO14Hh4B7Z.64apC5TgRVsg14wWBo3M6m", activated: false, activated_at: nil, remember_digest: nil, reset_digest: nil, reset_sent_at: nil},
#   {name: "student14", email: "student14@gmail.com", password_digest: "$2a$10$pt5sqD0lBN9PPzMX8OoC4OBOyzsJZVc5AEsTVMwJTOoA4DXx0gHlO", activation_digest: "$2a$10$jh331pQ2xghGtk61VZCgvu9QZdyVxMQlMKYhF2xOc69TPBP7D0sH6", activated: false, activated_at: nil, remember_digest: nil, reset_digest: nil, reset_sent_at: nil},
#   {name: "student15", email: "student15@gmail.com", password_digest: "$2a$10$zkCOG/gWElHPJT0QKczCc.JbpOyQf3WvDrFzqj05/trTA2hkNXAK6", activation_digest: "$2a$10$vS31bqBy5E222xgGQp5aZeBZz0ph44Y/toSEpFd/VO0pNbmwjH926", activated: false, activated_at: nil, remember_digest: nil, reset_digest: nil, reset_sent_at: nil},
#   {name: "Sami", email: "sami@actualize.co", password_digest: "$2a$10$N/nfcXrtjb0A75A9.AV/Ruz6tntaaAB18YbTAhGnyrdjtrElC2H9y", activation_digest: "$2a$10$InRI86KwyYZN2udQgfDUC.pSTiBic4gt3MpjmaLhhxye3wfpcz7re", activated: true, activated_at: "2017-07-24 20:50:54", remember_digest: nil, reset_digest: nil, reset_sent_at: nil},
#   {name: "student1", email: "maktraore2005@yahoo.fr", password_digest: "$2a$10$ObCx2CpPxcQSiAscayvyXuhIcdU3FqHZZorvFzwU9SMNlJGG1cTOK", activation_digest: nil, activated: true, activated_at: nil, remember_digest: nil, reset_digest: "$2a$10$qUeZdTZ/MockKalaNALdc.HlXsyEmeTdl67AN0nDT.QQsHuPNVI8C", reset_sent_at: "2017-07-25 23:17:39"}
# ])

# CampusEmployee.create!([
#   {employee_id: 118, location_id: 1},
#   {employee_id: 118, location_id: 2},
#   {employee_id: 104, location_id: 3},
#   {employee_id: 104, location_id: 2},
#   {employee_id: 121, location_id: 2},
#   {employee_id: 120, location_id: 3},
#   {employee_id: 120, location_id: 2},
#   {employee_id: 122, location_id: 1},
#   {employee_id: 117, location_id: 3},
#   {employee_id: 103, location_id: 1},
#   {employee_id: 103, location_id: 5}
# ])
# CampusSubject.create!([
#   {location_id: 1, subject_id: 4},
#   {location_id: 4, subject_id: 4},
#   {location_id: 3, subject_id: 1},
#   {location_id: 3, subject_id: 1},
#   {location_id: 2, subject_id: 6},
#   {location_id: 3, subject_id: 6},
#   {location_id: 1, subject_id: 2},
#   {location_id: 5, subject_id: 2},
#   {location_id: 3, subject_id: 3},
#   {location_id: 3, subject_id: 3},
#   {location_id: 4, subject_id: 7},
#   {location_id: 2, subject_id: 7},
#   {location_id: 4, subject_id: 5},
#   {location_id: 4, subject_id: 5},
#   {location_id: 5, subject_id: 9},
#   {location_id: 2, subject_id: 9},
#   {location_id: 2, subject_id: 10},
#   {location_id: 5, subject_id: 10},
#   {location_id: 3, subject_id: 8},
#   {location_id: 3, subject_id: 8}
# ])
Chatroom.create!([
  {user_id: 2, employee_id: 3},
  {user_id: 2, employee_id: 1},
  {user_id: 3, employee_id: 1},
  {user_id: 1, employee_id: 4},
  {user_id: 1, employee_id: 9},
  {user_id: 2, employee_id: 12},
  {user_id: 1, employee_id: 10},
  {user_id: 3, employee_id: 10},
  {user_id: 3, employee_id: 11},
  {user_id: 2, employee_id: 11},
  {user_id: 3, employee_id: 12},
  {user_id: 1, employee_id: 10},
  {user_id: 1, employee_id: 11},
  {user_id: 1, employee_id: 1},
  {user_id: 2, employee_id: 7},
  {user_id: 1, employee_id: 2},
  {user_id: 6, employee_id: 3},
  {user_id: 6, employee_id: 1},
  {user_id: 10, employee_id: 3},
  {user_id: 10, employee_id: 2}
])

EmployeeSubject.create!([
  {employee_id: 8, subject_id: 3, courses_tutored: "English"},
  {employee_id: 12, subject_id: 1, courses_tutored: "Calculus I, Calculus II, math105,math115, math116, pre-calc"},
  {employee_id: 4, subject_id: 1, courses_tutored: "math 116, Math 105, calculus I, calculus II"},
  {employee_id: 5, subject_id: 3, courses_tutored: "spanish"},
  {employee_id: 4, subject_id: 2, courses_tutored: "MBA, Statistics, Physics, Calculus"},
  {employee_id: 10, subject_id: 5, courses_tutored: "MBA"},
  {employee_id: 12, subject_id: 2, courses_tutored: "Biology"},
  {employee_id: 2, subject_id: 2, courses_tutored: "business, accounting"},
  {employee_id: 3, subject_id: 1, courses_tutored: "All levels of Math"},
  {employee_id: 7, subject_id: 2, courses_tutored: "Statistics, bio1"}
])


# Message.create!([
#   {body: "fine and you?", user_id: 1, chatroom_id: 14, employee_id: nil, read: true},
#   {body: "what did you say?", user_id: 1, chatroom_id: 14, employee_id: nil, read: true},
#   {body: "ok thanks", user_id: 1, chatroom_id: 14, employee_id: nil, read: true},
#   {body: "great", user_id: nil, chatroom_id: 14, employee_id: 103, read: true},
#   {body: "that you are great", user_id: nil, chatroom_id: 14, employee_id: 103, read: true},
#   {body: "hi", user_id: nil, chatroom_id: 14, employee_id: 103, read: true},
#   {body: "?", user_id: nil, chatroom_id: 14, employee_id: 103, read: true},
#   {body: "hu there", user_id: nil, chatroom_id: 14, employee_id: 103, read: true},
#   {body: "hello", user_id: 1, chatroom_id: 14, employee_id: nil, read: true},
#   {body: "fsdfsd", user_id: 1, chatroom_id: 14, employee_id: nil, read: true},
#   {body: "dfsdfs", user_id: 1, chatroom_id: 14, employee_id: nil, read: true},
#   {body: "fsdfds", user_id: 1, chatroom_id: 14, employee_id: nil, read: true},
#   {body: "dfsfsd", user_id: 1, chatroom_id: 14, employee_id: nil, read: true},
#   {body: "hello", user_id: nil, chatroom_id: 14, employee_id: 103, read: true},
#   {body: "umm", user_id: nil, chatroom_id: 14, employee_id: 103, read: true},
#   {body: "hello", user_id: nil, chatroom_id: 14, employee_id: 103, read: true},
#   {body: "I will see", user_id: nil, chatroom_id: 10, employee_id: 103, read: false},
#   {body: "hey", user_id: nil, chatroom_id: 14, employee_id: 103, read: true},
#   {body: "but when refresh problem", user_id: nil, chatroom_id: 10, employee_id: 103, read: false},
#   {body: "there", user_id: nil, chatroom_id: 14, employee_id: 103, read: true},
#   {body: "it", user_id: nil, chatroom_id: 14, employee_id: 103, read: true},
#   {body: "increases", user_id: nil, chatroom_id: 14, employee_id: 103, read: true},
#   {body: "fdsfds", user_id: 1, chatroom_id: 14, employee_id: nil, read: nil},
#   {body: "umm", user_id: 1, chatroom_id: 14, employee_id: nil, read: nil},
#   {body: "hello", user_id: 2, chatroom_id: 12, employee_id: nil, read: false},
#   {body: "Hello Mamadou", user_id: 2, chatroom_id: 3, employee_id: nil, read: true},
#   {body: "Great", user_id: 2, chatroom_id: 3, employee_id: nil, read: true},
#   {body: "hi", user_id: nil, chatroom_id: 14, employee_id: 103, read: true},
#   {body: "hi", user_id: nil, chatroom_id: 14, employee_id: 103, read: true},
#   {body: "work before refesh", user_id: 3, chatroom_id: 10, employee_id: nil, read: true},
#   {body: "How are you student 2?", user_id: nil, chatroom_id: 3, employee_id: 103, read: true},
#   {body: "sqrt(2)", user_id: 1, chatroom_id: 14, employee_id: nil, read: true},
#   {body: "√2x-3 = 5x", user_id: 1, chatroom_id: 14, employee_id: nil, read: true},
#   {body: "x = 0", user_id: 1, chatroom_id: 14, employee_id: nil, read: true},
#   {body: "what's up", user_id: 1, chatroom_id: 14, employee_id: nil, read: true},
#   {body: "hello", user_id: nil, chatroom_id: 14, employee_id: 103, read: true},
#   {body: "hey", user_id: nil, chatroom_id: 14, employee_id: 103, read: true},
#   {body: "gooog", user_id: 1, chatroom_id: 14, employee_id: nil, read: true},
#   {body: "dfkkfdkf", user_id: nil, chatroom_id: 14, employee_id: 103, read: true},
#   {body: "dfgg", user_id: nil, chatroom_id: 14, employee_id: 103, read: true},
#   {body: "hey", user_id: 1, chatroom_id: 14, employee_id: nil, read: true},
#   {body: "hey", user_id: 1, chatroom_id: 14, employee_id: nil, read: true},
#   {body: "dsjdjjdds", user_id: nil, chatroom_id: 14, employee_id: 103, read: true},
#   {body: "what's up", user_id: nil, chatroom_id: 14, employee_id: 103, read: true},
#   {body: "hello", user_id: 1, chatroom_id: 14, employee_id: nil, read: true},
#   {body: "ddhfjfj", user_id: nil, chatroom_id: 14, employee_id: 103, read: true},
#   {body: "hello", user_id: 1, chatroom_id: 14, employee_id: nil, read: true},
#   {body: "hey ", user_id: 6, chatroom_id: 19, employee_id: nil, read: true},
#   {body: "hello", user_id: nil, chatroom_id: 19, employee_id: 103, read: true},
#   {body: "i need help", user_id: 6, chatroom_id: 19, employee_id: nil, read: true},
#   {body: "hello I need help", user_id: 6, chatroom_id: 19, employee_id: nil, read: true},
#   {body: "what do you need help with?", user_id: nil, chatroom_id: 19, employee_id: 103, read: true},
#   {body: "hello Mamadou", user_id: 6, chatroom_id: 19, employee_id: nil, read: true},
#   {body: "Hey student 6", user_id: nil, chatroom_id: 19, employee_id: 103, read: true},
#   {body: "hello", user_id: 6, chatroom_id: 19, employee_id: nil, read: true},
#   {body: "hey", user_id: nil, chatroom_id: 19, employee_id: 103, read: true},
#   {body: "hey", user_id: 10, chatroom_id: 21, employee_id: nil, read: true},
#   {body: "hey", user_id: 10, chatroom_id: 22, employee_id: nil, read: true},
#   {body: "hello", user_id: nil, chatroom_id: 22, employee_id: 120, read: false},
#   {body: "hello", user_id: 6, chatroom_id: 20, employee_id: nil, read: false},
#   {body: "what's up?", user_id: nil, chatroom_id: 21, employee_id: 103, read: true},
#   {body: "hello", user_id: 10, chatroom_id: 21, employee_id: nil, read: true},
#   {body: "hi", user_id: nil, chatroom_id: 21, employee_id: 103, read: false},
#   {body: "hi", user_id: 6, chatroom_id: 19, employee_id: nil, read: true},
#   {body: "hello", user_id: 6, chatroom_id: 19, employee_id: nil, read: true},
#   {body: "hi", user_id: nil, chatroom_id: 19, employee_id: 103, read: false},
#   {body: "hi", user_id: 6, chatroom_id: 20, employee_id: nil, read: false}
# ])
Photo.create!([
  {title: "seyba", image_file_name: "_MG_3053.jpg", image_content_type: "image/jpeg", image_file_size: 537907, image_updated_at: "2017-07-07 07:12:25", employee_id: 3},
  {title: "sow", image_file_name: "google-logo.jpg", image_content_type: "image/jpeg", image_file_size: 40103, image_updated_at: "2017-07-07 07:24:29", employee_id: 3},
  {title: "Mamadou", image_file_name: "_MG_3054.jpg", image_content_type: "image/jpeg", image_file_size: 501232, image_updated_at: "2017-07-07 07:27:47", employee_id: 3},
  {title: "rochelle", image_file_name: "girl.jpg", image_content_type: "image/jpeg", image_file_size: 102445, image_updated_at: "2017-07-14 22:56:17", employee_id: 6}
])

Survey.create!([
  {student_email: "seyba@gmail.com", question1: "Manhattan", question2: "Math", question3: "Teacher", question4: "Freshman", question5: "Strongly agree", question6: "Strongly agree", question7: "Strongly agree", question8: "Excellent", question9: "more tutors", question10: "To learn", question11: "come back", question12: "come back", question13: "none"},
  {student_email: "sami@actualize.co", question1: "Manhattan", question2: "Math", question3: "Teacher", question4: "Freshman", question5: "Strongly agree", question6: "Strongly agree", question7: "Strongly agree", question8: "Excellent", question9: "sdfsdfs", question10: "fsdfsfds", question11: "sfdsdfs", question12: "sdfsdfsdf", question13: "sdfsfsd"}
])
# Timeslot.create!([
#   {start_time: "12:00 pm", end_time: "5:00pm", days: "saturdays", semester: "fall", approved: true, location_id: 2},
#   {start_time: "9:45 am", end_time: "5:00 pm", days: "Mondays", semester: "fall", approved: true, location_id: 3},
#   {start_time: "12:00 pm", end_time: "5:00pm", days: "saturdays", semester: "fall", approved: true, location_id: 3},
#   {start_time: "9:45 am", end_time: "5:00 pm", days: "Mondays", semester: "fall", approved: true, location_id: 2},
#   {start_time: "9:30 am", end_time: "2:30 pm", days: "Tuesdays", semester: "fall", approved: true, location_id: 1},
#   {start_time: "3:00 pm", end_time: "7:00 pm", days: "Fridays", semester: "fall", approved: true, location_id: 5},
#   {start_time: "3:00 pm", end_time: "7:00 pm", days: "Fridays", semester: "fall", approved: true, location_id: 1},
#   {start_time: "10:00 am", end_time: "3:00 pm", days: "Tuesdays", semester: "fall", approved: true, location_id: 1},
#   {start_time: "10:00 am", end_time: "2:00pm", days: "Fridays", semester: "fall", approved: true, location_id: 2},
#   {start_time: "1pm", end_time: "6pm", days: "Tuesdays", semester: "fall", approved: true, location_id: 3},
#   {start_time: "9:45 am", end_time: "12:45 pm", days: "Mondays", semester: "fall", approved: true, location_id: 2},
#   {start_time: "2pm", end_time: "6pm", days: "Fridays", semester: "fall", approved: true, location_id: 2},
#   {start_time: "19:45am", end_time: "1:30pm", days: "Mondays/Wednesdays", semester: "fall", approved: true, location_id: 1},
#   {start_time: "9:30 am", end_time: "2:30 pm", days: "Mondays", semester: "fall", approved: true, location_id: 2},
#   {start_time: "2pm", end_time: "6pm", days: "Mondays", semester: "fall", approved: true, location_id: 2},
#   {start_time: "12pm", end_time: "3pm", days: "Fridays", semester: "fall", approved: true, location_id: 1},
#   {start_time: "9:45am", end_time: "2:30pm", days: "Mondays/Wednesdays", semester: "fall", approved: true, location_id: 1},
#   {start_time: "2:00pm", end_time: "6:00pm", days: "Fridays", semester: "fall", approved: true, location_id: 1},
#   {start_time: "12:00pm", end_time: "5:00pm", days: "Saturdays", semester: "Spring", approved: true, location_id: 4},
#   {start_time: "2:00 pm", end_time: "6:00 pm", days: "Mondays", semester: "fall", approved: true, location_id: 1},
#   {start_time: "12:00pm", end_time: "5:00pm", days: "Mondays", semester: "Summer", approved: true, location_id: 4}
# ])
# EmployeeTimeSlot.create!([
#   {timeslot_id: 64, employee_id: 120},
#   {timeslot_id: 3, employee_id: 120},
#   {timeslot_id: 49, employee_id: 122},
#   {timeslot_id: 74, employee_id: 117},
#   {timeslot_id: 70, employee_id: 103},
#   {timeslot_id: 50, employee_id: 103},
#   {timeslot_id: 51, employee_id: 103},
#   {timeslot_id: 51, employee_id: 118},
#   {timeslot_id: 52, employee_id: 118},
#   {timeslot_id: 53, employee_id: 104},
#   {timeslot_id: 1, employee_id: 104},
#   {timeslot_id: 67, employee_id: 121}
# ])

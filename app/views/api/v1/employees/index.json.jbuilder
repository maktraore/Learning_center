
    json.array!  @json_array do |employee|

      json.id employee.id
      json.full_name employee.full_name
      json.email employee.email
      json.phone_number employee.phone_number
      json.bio employee.bio
      json.image employee.image
      json.admin employee.admin
      json.approved employee.approved
      json.courses_tutored employee.employee_subjects.each do |course|
          json.courses_tutored  course.courses_tutored
      end
      json.departments employee.subjects.each do |course|
          json.department  course.department
          end

      json.locations employee.locations.each do |location|
          json.location_id location.id
          json.name location.name
          json.address location.address
          json.phone_number location.phone_number

          json.location_timeslots location.timeslots.each do |time|
          json.timeslot_id time.id 
          json.start_time  time.start_time 
          json.end_time  time.end_time 
          json.end_time  time.end_time 
          json.days  time.days 
          json.approved  time.approved 
          json.location_id time.location_id
     end

   end
   end
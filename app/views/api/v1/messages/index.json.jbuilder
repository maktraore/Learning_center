json.array! @messages.each do |message|
  json.id message.id
  json.body message.body
  if message.user
    json.name message.user.name
  elsif message.employee
    json.name message.employee.full_name
  end
  json.chatroom_id message.chatroom_id
  json.read message.read
  json.created_at message.created_at
end

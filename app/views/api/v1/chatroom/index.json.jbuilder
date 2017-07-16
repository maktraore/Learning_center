json.array! @chatrooms.each do |chat|
  json.id chat.id
  json.body chat.body
  if chat.user
    json.name chat.user.name
  elsif chat.employee
    json.name chat.employee.full_name
  end
  json.chatroom_id chat.chatroom_id
  json.created_at chat.created_at
end

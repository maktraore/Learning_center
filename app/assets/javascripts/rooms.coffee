# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $messages = $('#messages')
  $messages.scrollTop($messages[0].scrollHeight)
  # $('#message_input').focus()
$(document).on 'keypress', '#message_input', (e) ->
  if e.keyCode == 13 and e.target.value
    $conversation_id = $('#conversation_id').val()
    $user_id = $('#user_id').val()
    $employee_id = $('#employee_id').val()
    $recipient_id = $('#recipient_id').val()

    # link = document.getElementById("chatroom-" + $conversation_id + "-" + $recipient_id);
    # array = link.innerHTML.split(" ");
    # number = array[array.length - 1];
    # array[array.length - 1] = parseInt(number) + 1;
    # link.innerHTML = array.join(" ");
    App.room.speak(e.target.value, $conversation_id, $user_id, $employee_id)
    e.target.value = ''
    e.preventDefault()

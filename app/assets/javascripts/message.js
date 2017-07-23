// document.addEventListener("DOMContentLoaded", function(event) { 
//   var app = new Vue({
//     el: '#app',
//     data: {
//       messages: [],
//       newMessageBody:  ""
//     },
    
//        mounted: function() {
//       $.get('/api/v1/messages.json', function(data) {
//         this.messages = data 
//       }.bind(this));
//     },
//     methods: {
//       getMessages: function(){
//         $.get('/api/v1/messages.json', function(data) {
//         this.messages = data 
//       }.bind(this));
//       },
//       addMessage: function(){
//         var params = {
//            body: this.newMessageBody,
//            user_id: gon.user_id,
//            employee_id: gon.employee_id
//         };
//          $.post('/api/v1/messages', params, function(data) {
//           console.log(data);
//           this.messages.push(data).body;
//       }.bind(this));
//       }
//     }

//   });

// });

function markRead(chatroomId, studentId, employeeId, name) {
  // post request with jquery to update the database. mark all the messages of that employee and chatroom to be read (mark as true)
        if (employeeId) {

          var params = {
            chatroom_id: chatroomId,
            employee_id: employeeId
          };
          var id = "chatroom-" + chatroomId + "-" + employeeId;
        } else {
          var params = {
            chatroom_id: chatroomId,
            student_id: studentId
          };
          var id = "chatroom-" + chatroomId + "-" + studentId;
        }
         $.ajax({
          url: '/api/v1/messages' + '.json',
          type: 'PATCH',
          data: params,
          success: function(response) {
        // $ajax.patch("/api/v1/messages.json", params).then(function(response) {
          // channel.$forceUpdate();
          // console.log(document.getElementById(id));
          document.getElementById(id).innerHTML = name + " " + response.count; // this number should come from the API call
          }
        });
  // create an api controller for messages to make the API call to.
}
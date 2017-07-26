// document.addEventListener("DOMContentLoaded", function(event) { 
//   var app = new Vue({
//     el: '#app',
//     data: {
//       chats: [],
//       newchatBody:  ""
//     },
    
//        mounted: function() {
//       $.get('/api/v1/chats.json', function(data) {
//         this.chats = data 
//       }.bind(this));
//     },
//     methods: {
//       getchats: function(){
//         $.get('/api/v1/chats.json', function(data) {
//         this.chats = data 
//       }.bind(this));
//       },
//       addchat: function(){
//         var params = {
//            body: this.newchatBody,
//            user_id: gon.user_id,
//            employee_id: gon.employee_id
//         };
//          $.post('/api/v1/chats', params, function(data) {
//           console.log(data);
//           this.chats.push(data).body;
//       }.bind(this));
//       }
//     }

//   });

// });
// App.messages = App.cable.subscriptions.create('MessagesChannel', {  
//   received: function(data) {
//     $("#messages-" + data.room_id).removeClass('hidden')
//     return $('#messages-' + data.room_id).append(this.renderMessage(data));
//   },
//   renderMessage: function(data) {
//     $(".form-control").val('');
//     return "<p><b>" + data.user + ": </b>" + data.message + "</p>";
//   }
// });

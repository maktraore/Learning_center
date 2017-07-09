document.addEventListener("DOMContentLoaded", function(event) { 
  var app = new Vue({
    el: '#app',
    data: {
      messages: ["message1", "message2", "message3"],
      newMessageBody:  "test"

    },
    methods: {
      addMessage: function(){
        var params = {
           body: this.newMessageBody,
           user_id: gon.user_id
           // user_id: this
        };
         $.post('/api/v1/messages.json', params, function(data) {
          this.messages.push(data.body);
      }.bind(this));
      }
    }

  });

});
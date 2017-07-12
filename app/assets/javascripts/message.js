document.addEventListener("DOMContentLoaded", function(event) { 
  var app = new Vue({
    el: '#app',
    data: {
      messages: [],
      newMessageBody:  "test"
    },
    
       mounted: function() {
      $.get('/api/v1/messages.json', function(data) {
        this.messages = data 
      }.bind(this));
    },
    methods: {
      getMessages: function(){
        $.get('/api/v1/messages.json', function(data) {
        this.messages = data 
      }.bind(this));
      },
      addMessage: function(){
        var params = {
           body: this.newMessageBody,
           user_id: gon.user_id
        };
         $.post('/api/v1/messages', params, function(data) {
          console.log(data)
          this.messages.push(data).body;
      }.bind(this));
      }
    }

  });

});
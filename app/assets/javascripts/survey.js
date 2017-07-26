// document.addEventListener("DOMContentLoaded", function(event) {
//   var app = new Vue({
//     el: '#survey',
//    data: {
//       questions: [{text: "At campus did your tutoring session take place?", answer: null},
//                        {text: 'What subject were you tutored today?', answer: null}, 
//                        {text: 'How did you first hear about Learning center?', answer: null},
//                        {text: 'Are you a', answer: null},
//                        {text: 'My tutor was knowledgeable about the subject being tutored?', answer: null},
//                        {text: 'After my session I feel more comfortable about the subject under discussion?', answer: null},
//                        {text: 'Based on my experience today, I will recommend the learning center service to another student?', answer: null},
//                        {text: 'Over all my experience at the learning center was', answer: null},
//                        {text: 'Why did come to this tutoring session today?', answer: null},
//                        {text: 'What did you learn that was new during this tutoring session?', answer: null},
//                        {text: ' What would do next to ensure that you do well in this class?', answer: null},
//                        {text: 'How did you first hear about Learning centerWhat else could we do to help you do well in this class?', answer: null},
//                        {text: 'How did you first hear about Learning center?', answer: null},
//                        {text: 'Additional comments?', answer: null}],
//           currentQuestionIndex: 0,
//           nextArr: [],
//           allQuestionsArr:[],
//           section1: 
//        },

//   mounted: function () {
//       this.nextArr.push(this.questions[this.currentQuestionIndex]);
//   },

//    methods: {
//     next: function () {
//       this.currentQuestionIndex +=1;
//       if (this.currentQuestionIndex >= this.questions.length) {
//         this.currentQuestionIndex = 0;
//       }
//     },
//     prev: function () {
//       this.currentQuestionIndex =0;
//       if (this.currentQuestionIndex >= this.questions.length) {
//         this.currentQuestionIndex -=1;
//       }
//     }

//     }  

//   });

// });

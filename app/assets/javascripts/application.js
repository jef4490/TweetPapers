// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

function tweetStrip(tweet_link) {
  return tweet_link.replace(/.*status\//g,"")
}

function tweet_number(tweet) {
 let start = /^\d*/g
 let end = /\d*$/g
 if (tweet.match(start) == false) {
   return tweet.match(end)[0]
 } else if (tweet.match(end) == false) {
   return tweet.match(start)[0]
 } else {
   return console.log("alternate case")
 }
}

$(document).ready(function(){
  $("#tweet-url-form").on('submit', function(event) {
    event.preventDefault();
    var final = 12
    let user = ""
    let url = tweetStrip($('#tweet-url-text').val())
    $.getJSON(`tweet/${url}`, function(data) {
      user = data.user.id
      return data
    }).
    then(function(data) {
      return $.getJSON(`tweet/${url}/${user}/${final}`)
    }).
    then(function(tweet_timeline) {
      debugger;
    })
  });
})

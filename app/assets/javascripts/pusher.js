$( document ).ready(function() {
  $(".media").show("normal");

  Pusher.log = function(message) {
    if (window.console && window.console.log) {
      window.console.log(message);
    }
  };

  var pusher = new Pusher('3247551819342bc16bba', {
    encrypted: true
  });

  // Use pathname (posts4, articles3) as channel
  var urlPathArray = window.location.pathname.split('/');
  var channel = pusher.subscribe(urlPathArray[1] + urlPathArray[2]);

  channel.bind('comments/create', function(html) {
    $("#new_comment")[0].reset();

    $(String(html)).prependTo("#comments").fadeIn('slow')
  });
});

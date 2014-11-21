$(document).ready(function(){

  $('#i_want_json').on("click", iWantJson)


  $('#i_want_json2')
    .bind('ajax:success', function(evt, data, status, xhr){
      console.log("in the 'jsonSuccess' iWantJson fucntion");
    })
    .bind('ajax:error', function(evt, xhr, status, error){
      console.log("in the 'jsonError' iWantJson fucntion");
    })
    .bind("ajax:beforeSend", function(evt, xhr, status){
      console.log("in the 'jsonComplete' iWantJson fucntion");
    })
    .bind('ajax:complete', function(evt, xhr, settings){
      console.log("in the 'jsonBeforeSend' iWantJson fucntion");
    });

});



 

function iWantJson (event) {
  event.preventDefault();
  console.log("in the iWantJson function")

  $.ajax({
    type: "GET",
    url: $(this).attr("href"),
  })

  .success(function(data){
    console.log("in the 'success' iWantJson fucntion");
  })
  .error(function(data){
    console.log("in the 'failure' iWantJson  callback function")
  })
  .done(function(data){
    console.log("in the 'done' iWantJson  function")
  })
}




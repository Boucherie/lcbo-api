document.addEventListener('DOMContentLoaded', function () {
  console.log("ready!");

  $.ajax({
    url: "/inventories",
    type: 'GET'
  }).done(function(data){
    console.log(data);
  });
  // storeLookupResults(data)



  // $.ajax({
  //   url: "/inventories",
  //   method: "GET",
  //   dataType: "transformed_results"
  // }).done(function(data){
  //   console.log(data);
  // });

})

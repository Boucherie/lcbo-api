document.addEventListener('DOMContentLoaded', function () {
  console.log("ready!");
  $.ajax({
    url: "/inventories",
    method: "GET",
    dataType: "json"
  }).done(function(data){
    data.forEach(function(item){
      transformed_results.toString();
    });
    console.log(transformed_results);
  });

}

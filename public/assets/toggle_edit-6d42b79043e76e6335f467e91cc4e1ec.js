$(document).ready(function() {
  $('#edit').on('click', function() {
    $(".edit_group").toggle();
    $(this).text(function(i, text){
      return text === "Edit Watchlist" ? "Hide Edits" : "Edit Watchlist";
    });
  });
});

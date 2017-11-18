$(document).ready(function() {
  $("#add-song-btn").bind('click', addSong);
  $("#delete-a-song-btn").bind('click', deleteASong);
  $("#delete-all-songs-btn").bind('click', deleteAllSongs);
});

function addSong() {
  createSong($("#name").val(), $("#category").val(), $("#composer").val());
}

function createSong(name, category, composer) {
  var artistId = $("#artist").attr("data-artist-id");
  var newSong = {name: name, category: category, composer: composer, artist_id: artistId};
  $.ajax({
    type: "POST",
    url: "/artists/" + artistId + "/songs.json",
    data: JSON.stringify({
      song: newSong
    }),
    contentType: "application/json",
    dataType: "json"
  })
  .then(function(data){
     console.log(data);
     var songName = $("<p></p>")
       .html(name);
     var songCategory = $("<p></p>")
       .html("Category: " + category);
     var songComposer = $("<p></p>")
       .html("Composer: " + composer);
     var listItem = $("<li></li>")
        .append(songName).append(songCategory).append(songComposer);
     $("ul").append(listItem);
  }, function(data){
    console.log("fail: " + data);
  });
}

function deleteASong(event) {
  var id = $(this).attr("data-song-id");
  deleteOneSong(id);

}
function deleteOneSong(id){
  var artistId = $("#artist").attr("data-artist-id");
  $.ajax({
      type: "DELETE",
      url: "/artists/" + artistId + "/songs/" + id + ".json",
      contentType: "application/json",
      dataType: "json"
    })
    .done(function(data) {
      $('li[data-song-id="'+id+ '"]').remove();
    });
  }
  function deleteAllSongs() {
    var artistId = $("#artist").attr("data-artist-id");
    $.ajax({
        type: "DELETE",
        url: "/artists/" + artistId + "/songs.json",
        contentType: "application/json",
        dataType: "json"
      })
      .done(function(data) {
        $("li").remove();
      });
    }

$(document).ready(function() {
  $("#add-song-btn").bind('click', addSong);
  $(".remove-a-song-btn").bind('click', deleteASong);
  $("#delete-all-songs-btn").bind('click', deleteAllSongs);
});

function addSong() {
  createSong($("#name").val(), $("#category").val(), $("#composer").val());
  $("#name").val(null);
  $("#category").val(null);
  $("#composer").val(null);
}

function createSong(name, category, composer) {
  var artistId = $("#artist").attr("data-artist-id");
  var newSong = {
    name: name,
    category: category,
    composer: composer,
    artist_id: artistId
  };
  $.ajax({
      type: "POST",
      url: "/artists/" + artistId + "/songs.json",
      data: JSON.stringify({
        song: newSong
      }),
      contentType: "application/json",
      dataType: "json"
    })
    .then(function(data) {
      console.log(data);

      var songName = $("<p></p>")
        .html(name);
      var songCategory = $("<p></p>")
        .html("Category: " + category);
      var songComposer = $("<p></p>")
        .html("Composer: " + composer);
      var div = $('<div />');
      var  btn = $('<input />', {
          type: 'button',
          value: 'Delete',
          class: 'btn btn-default remove-a-song-btn',
          on: {
            click: deleteASong
          }
        });

      var listItem = $("<li></li>", {
        "data-song-id": data.id,
        class: "song"
      })
        .append(songName).append(songCategory).append(songComposer);
      div.append(btn).appendTo(listItem);
      $("ul").append(listItem);



    }, function(data) {
      console.log("fail: " + data);
    });
}

function deleteASong(event) {
  var id = $(this).closest(".song").attr("data-song-id");
  deleteOneSong(id);

}

function deleteOneSong(id) {
  var artistId = $("#artist").attr("data-artist-id");
  $.ajax({
      type: "DELETE",
      url: "/artists/" + artistId + "/songs/" + id + ".json",
      contentType: "application/json",
      dataType: "json"
    })
    .then(function(data) {
      $('li[data-song-id="' + id + '"]').remove();
    });
}

function deleteAllSongs() {
  var artistId = $("#artist").attr("data-artist-id");


  // I use this hack to delete all songs related to a specific artist,
  // because I couldn't get a separate route to work.
  // Because the server won't be able to find the song id 0,
  // the destroy method of the server will just delete all songs.
 removeSong(artistId,0).then(function(){
      $('.song').remove();
 });
}

function removeSong(artistId, id) {

  return $.ajax({
      type: "DELETE",
      url: "/artists/" + artistId + "/songs/" + id + ".json",
      contentType: "application/json",
      dataType: "json"
    })
    .then(function(data) {
      $('li[data-song-id="' + id + '"]').remove();
    });

}

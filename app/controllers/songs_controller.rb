class SongsController < ApplicationController
before_action :set_song, only: [:show]

def index
  @artist= Artist.find(params[:artist_id])

end
def show
end

def new
  @artist= Artist.find(params[:artist_id])
  @song = @artist.songs.build
end
def create
  @artist= Artist.find(params[:artist_id])
  @song = @artist.songs.build(song_params)

  if @song.save
    redirect_to @artist, notice: "Song created."
  else
    render :new
  end
end
def destroy

  @song = Song.find(params[:id])
  @song.destroy
  redirect_to artist_path(@song.artist.id)
end
private

def set_song
    @song = Song.find(params[:artist_id])
end

def song_params
  params
    .require(:song)
    .permit(:name, :category, :composer, :artist_id)
end
end

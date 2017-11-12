class SongsController < ApplicationController
before_action :set_song, only: [:show, :delete]

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
private

def set_song
    @song = Song.find(params[:artist_id])
end

def song_params
  params
    .require(:song)
    .permit(:name, :category, :composer)
end
end

class SongsController < ApplicationController
before_action :get_artist

def index
@songs = @artist.songs
end

def show
  @songs = @artist.songs
end

def new
  @song = @artist.songs.build
end
def create
  @song = @artist.songs.build(song_params)
  respond_to do |format|
    if @song.save
      format.html {redirect_to @artist, notice: "Song created."}
      format.json { render :show, status: :created}
    else
      render :new
      format.html {redirect_to @artist}
      format.json { render json: @song.errors, status: :unprocessable_entity }
    end
  end
end
def destroy
  #If you want to find something by it's id attribute without forcing an exception,
  #use the dynamic finder find_by_id which will return false if it doesn't find a record with that id.

  if Song.find_by_id(params[:id])
    @song = Song.find(params[:id])
    @song.destroy
  else
    @artist.songs.each do |song|
      song.destroy
    end
  end
  respond_to do |format|
    format.html {redirect_to artist_path(@artist.id)}
    format.json  {render :delete, :layout => false}

end
end
private

def get_artist
  @artist= Artist.find(params[:artist_id])
end

def song_params
  params
    .require(:song)
    .permit(:name, :category, :composer, :artist_id)
end
end

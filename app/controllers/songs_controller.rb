class SongsController < ApplicationController
before_action :set_song, only: [:show, :new, :create]

def index
  @artist= Artist.find(params[:artist_id])
end
def show

end
private

def set_song
    @song = Song.find(params[:id])
end

def song_params
  params
    .require(:song)
    .permit(:name, :category, :composer)
end
end

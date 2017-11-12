class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end
  def show
    @artist = Artist.find(params[:id])
    redirect_to artist_songs_path(@artist.id)
  end
end

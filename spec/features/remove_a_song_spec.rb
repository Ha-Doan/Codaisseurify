require 'rails_helper'

feature 'Remove a song', js: true do
  scenario 'delete a song' do
    # Point your browser towards the artist_songs path
    artist = FactoryGirl.create :artist
    song = FactoryGirl.create :song, artist: artist
    visit artist_songs_path(artist)
    sleep(5)
    # click the "delete" button related to a song
    page.execute_script("$('.remove-a-song-btn').bind('click', deleteASong)")

   # Expect the deleted song is removed from the page
    expect(artist.songs).to_not include(song)
    expect(page).to_not have_content(song.name)
  end
end

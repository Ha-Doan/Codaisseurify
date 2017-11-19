require 'rails_helper'

feature 'Remove all songs', js: true do
  scenario 'delete all songs' do
    # Point your browser towards the artist_songs path
    artist = FactoryGirl.create :artist
    song1 = FactoryGirl.create :song, artist: artist
    song2 = FactoryGirl.create :song, artist: artist
    visit artist_songs_path(artist)

    # click the "delete all songs" button
    page.execute_script("$('#delete-all-songs-btn').click()")
    sleep(1)
    # Expect the deleted songs are removed from the page
    expect(artist.songs).to_not include(song1)
    expect(artist.songs).to_not include(song2)
    expect(page).to_not have_content(song1.name)
    expect(page).to_not have_content(song2.name)
  end
end

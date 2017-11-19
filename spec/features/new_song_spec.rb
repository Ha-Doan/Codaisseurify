require 'rails_helper'

feature 'New song', js: true do
  scenario 'add a new song' do
    # Point your browser towards the artist_songs path
    artist = FactoryGirl.create :artist
    visit artist_songs_path(artist)

    # Enter name in the text field
    fill_in 'name', with: 'Blessed be your name'
    sleep(2)
    # click the "add new song" button
    page.execute_script("$('add-song-btn').bind('click', addSong)")

    # Expect the new song to be displayed in the artist show page
    expect(page).to have_content('Blessed be your name')
  end
end

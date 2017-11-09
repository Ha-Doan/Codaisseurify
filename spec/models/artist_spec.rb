require 'rails_helper'

RSpec.describe Artist, type: :model do
  describe "association with song" do
  let(:artist) { create :artist }
  let!(:song1) { create :song, artist: artist }
  let!(:song2) { create :song, artist: artist }

  it "-has many songs" do
    expect(artist.songs).to include(song1)
    expect(artist.songs).to include(song2)
  end
end
end

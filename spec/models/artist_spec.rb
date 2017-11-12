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

  it "-deletes associated songs" do
    expect { artist.destroy }.to change(Song, :count).by(-2)
  end
end
describe "has one photo" do
    let(:artist) { create :artist }
    let!(:photo) { create :photo, artist: artist }

    it " - has one photo" do
      expect(artist.photo).to eq(photo)
    end
end
describe "can not have more than one photo" do
  let(:artist) { create :artist }
  let!(:photo1) { create :photo, artist: artist }
  let!(:photo2) { create :photo, artist: artist }

  it "- can not have more than one photo " do
      expect {artist.photo.destroy}.to change(Photo, :count).by(-1)
  end
describe "validations" do
  it "is invalid without a name" do
    artist = Artist.new(name: "")
    artist.valid?
    expect(artist.errors).to have_key(:name)
  end
end
end

require 'rails_helper'

RSpec.describe Photo, type: :model do
  describe "association with artist" do
  let(:artist) { create :artist}

  it "-belongs to an artist" do
  artist.photo = FactoryGirl.create(:photo) #artist indeed knows about photo
  photo = artist.photo #artist.photo indeed stores a photo!!
  expect(photo.artist).to eq(artist)
  end
  end
end

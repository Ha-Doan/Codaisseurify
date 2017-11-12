class Artist < ApplicationRecord

  has_one :photo, dependent: :destroy
  has_many :songs, dependent: :destroy
  accepts_nested_attributes_for :songs
end

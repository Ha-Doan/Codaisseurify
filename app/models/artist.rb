class Artist < ApplicationRecord
  has_one :photo
  has_many :songs, dependent: :destroy
end

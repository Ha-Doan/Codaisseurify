class Artist < ApplicationRecord

  has_one :photo, dependent: :destroy
  has_many :songs, dependent: :destroy

  validates :name, presence: true
end

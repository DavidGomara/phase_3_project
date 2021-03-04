class Artist < ApplicationRecord
    validates :name, presence: true
    belongs_to :user, optional: true
    has_many :albums
    has_many  :songs, through: :albums
    has_many :genres, through: :songs
    has_many :reviews
end

class Genre < ApplicationRecord
    validates :name, presence: true
    has_many :songs
    has_many :albums, through: :songs
    has_many :artists, through: :albums
end

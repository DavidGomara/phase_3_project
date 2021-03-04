class Album < ApplicationRecord
    validates :name, presence: true
    belongs_to :user, optional: true
    belongs_to :artist
    has_many :songs
    has_many :reviews
end

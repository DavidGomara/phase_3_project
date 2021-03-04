class Song < ApplicationRecord
    validates :name, presence: true
    belongs_to :user, optional: true
    belongs_to :artist, optional: true
    belongs_to :album
    has_many :reviews
end

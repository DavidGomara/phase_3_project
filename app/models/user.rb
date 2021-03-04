class User < ApplicationRecord
    has_secure_password
    has_many :artists
    has_many :albums, through: :artists
    has_many :songs, through: :albums
    validates :email, presence: true, uniqueness: true 
    validates :username, presence: true
    validates :password, length: {minimum: 6, message:"Password must be atleast 6 characters long."}
end

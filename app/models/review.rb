class Review < ApplicationRecord
    validates :description, presence: true
    validates :rating, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5,  only_integer: true }
    belongs_to :user, optional: true
    belongs_to :artist, optional: true
    belongs_to :album, optional: true
    belongs_to :song, optional: true

    def self.average_of_instance(instance)
        reviews = []
        instance.reviews.each do |r|
            reviews << r.rating if r.rating != nil
        end 
        counter = 0
        divided_by = reviews.length
        reviews.each do |r|
            counter += r 
        end 
        if divided_by > 0
            num_1 = counter.to_f
            num_2 = divided_by.to_f
            avg = num_1.fdiv(num_2)
        else 
            avg = nil
        end 
        avg
    end 
end

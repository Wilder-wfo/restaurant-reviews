class Restaurant < ApplicationRecord         # has_many gives the collection -> restaurant.reviews
    has_many :reviews, dependent: :destroy   # When a restaurant deleted so its reviews must be deleted
end

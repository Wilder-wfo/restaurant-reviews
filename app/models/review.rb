class Review < ApplicationRecord   # we require:  @review.restaurant = @restaurant
  belongs_to :restaurant  # It's already a validation, that is why in create of review_controller 
  validates :content, length: { minimum: 3 }
end                       # belongs_to gives the collection -> review.restaurant

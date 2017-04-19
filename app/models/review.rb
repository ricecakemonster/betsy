class Review < ApplicationRecord
  belongs_to :product
  validates :rating, presence: true, inclusion: { in: [1, 2, 3, 4, 5], message: "%{value} rating value must be between 1 and 5"}
end

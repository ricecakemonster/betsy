class Review < ApplicationRecord
  belongs_to :product
<<<<<<< HEAD
  validates :rating, presence: true, inclusion: { in: [1, 2, 3, 4, 5], message: "%{value} rating value must be between 1 and 5"}
=======
  validates :rating, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
>>>>>>> master-1
end

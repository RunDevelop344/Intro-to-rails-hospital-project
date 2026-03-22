class Review < ApplicationRecord
  belongs_to :hospital

validates :rating, inclusion: { in: 1..5 }
validates :comment, presence: true
end

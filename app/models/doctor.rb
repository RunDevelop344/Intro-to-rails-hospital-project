class Doctor < ApplicationRecord
  belongs_to :hospital

validates :name, presence: true
validates :specialty, presence: true
validates :email, presence: true, uniqueness: true
end

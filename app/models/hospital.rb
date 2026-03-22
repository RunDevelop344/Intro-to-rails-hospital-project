class Hospital < ApplicationRecord
has_many :doctors
has_many :departments
has_many :reviews

validates :name, presence: true
validates :address, presence: true
validates :phone, presence: true
end

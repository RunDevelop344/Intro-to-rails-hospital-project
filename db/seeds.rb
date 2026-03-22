# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


require 'faker'

# Hospitals
15.times do
  Hospital.create!(
    name: "#{Faker::Company.name} Hospital",
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    phone: Faker::PhoneNumber.phone_number,
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude
  )
end

specialties = [
  "Cardiology", "Neurology", "Pediatrics",
  "Orthopedics", "Dermatology", "Oncology"
]

departments = [
  "Emergency", "Surgery", "Radiology",
  "ICU", "Outpatient", "Pharmacy"
]

Hospital.all.each do |hospital|
  # Doctors
  8.times do
    Doctor.create!(
      name: Faker::Name.name,
      specialty: specialties.sample,
      email: Faker::Internet.unique.email,
      hospital: hospital
    )
  end

  # Departments
  3.times do
    Department.create!(
      name: Faker::Company.unique.name,
      hospital: hospital
    )
  end

  # Reviews
  6.times do
    Review.create!(
      rating: rand(1..5),
      comment: Faker::Lorem.sentence(word_count: 12),
      hospital: hospital
    )
  end
end
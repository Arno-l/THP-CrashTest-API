require 'faker'

User.destroy_all
Product.destroy_all
Order.destroy_all

10.times do
    User.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        password: Faker::Internet.password,
        address: Faker::Address.street_address,
        zipcode: "13390",
        phone: Faker::PhoneNumber.cell_phone_in_e164,
        seller: [true, false].sample
    )
end

puts " ---------- users created ------------"

20.times do
    Product.create(
        name: Faker::Coffee.blend_name,
        price: 10,
        country: Faker::Coffee.origin,
        description: Faker::Lorem.sentence,
        stock: 99,
        intensity: Faker::Coffee.intensifier,
        user_id: User.last.id
    )
end

puts " ---------- products created ------------"


15.times do
    Order.create(
       quantity: [0, 1, 2, 3, 4, 5].sample, 
       user_id: User.last.id,
       product_id: Product.last.id
    )
end

puts " ---------- orders created ------------"

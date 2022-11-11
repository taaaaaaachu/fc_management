# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Rails.env.development?
  admin = Admin.new(

    admin_id:               'Admin',
    email:                  'admin@example.com',
    password:               '123456',
    password_confirmation:  '123456'

  )
  admin.save!

  (1..20).each do |n|
    User.create!( email: "test#{n}@test.com",
                  password: "123456"
                )
  end
end

genres = %w{
  genre1
  genre2
}

genres.each do |genre|
  Genre.create!(name: genre)
end
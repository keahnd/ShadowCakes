# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(email: ENV["shadowsCakesEmail"], password: ENV["shadowsCakesAdminPass"],
			 password_confirmation: ENV["shadowsCakesAdminPass"], admin: true)

Category.create!(heading: "Brownie", body: "Its yum", display: true, id: 1)
Category.create!(heading: "Cakes", body: "The Shadow kind", display: true, id:2)
Category.create!(heading: "Cupcakes", body: "Little Ones", display: true, id:3)
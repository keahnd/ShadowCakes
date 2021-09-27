# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(email: "shadowscakes.bakery@gmail.com", password: "cookie$_pass",
			 password_confirmation: "cookie$_pass", admin: true)

Category.create!(heading: "Brownie", display: true, id: 1)
Category.create!(heading: "Cakes", display: true, id:2)
Category.create!(heading: "Cupcakes", display: true, id:3)
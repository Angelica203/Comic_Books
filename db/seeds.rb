# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Comic.create([
{title: "Black Panther", category: 'Marvel', published: 1999, price: 19.99},
{title: "Woverine", category: 'DC', published: 1980, price: 10.00},
{title: "Iron Man", category: 'Marvel', published: 2001, price: 25.50}
])
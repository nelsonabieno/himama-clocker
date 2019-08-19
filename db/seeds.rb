# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(
firstname: 'Nelson',
    lastname: 'Rotimi',
    password: 'admin',
    is_admin: true,
    login_status: false,
    email: 'nelsonabieno2@gmail.com',
    user_nick: 'adminadmin'
)

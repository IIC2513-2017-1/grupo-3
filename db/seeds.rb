# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(first_name: 'Federico', last_name: 'Kunze', email: 'fekunze@uc.cl',
            password: '123123', role: 'admin')
User.create(first_name: 'Gustavo', last_name: 'Antunes', email: 'gantunes@uc.cl',
            password: '123123', role: 'admin')
User.create(first_name: 'Gordon', last_name: 'Ramsay', email: 'gordon_ramsay@gmail.com',
            password: '123123', role: 'cook')
User.create(first_name: 'Jamie', last_name: 'Oliver', email: 'jamie_oliver@gmail.com',
            password: '123123', role: 'cook')

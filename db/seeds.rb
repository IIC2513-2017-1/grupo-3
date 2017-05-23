# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(first_name: 'Federico', last_name: 'Kunze', email: 'fekunze@uc.cl', password: '123123', address: 'Santiago, RM', phone: '922334455', gender: 'male', role: 'admin', activated: true)
User.create(first_name: 'Gustavo', last_name: 'Antunes', email: 'gantunes@uc.cl', password: '123123', address: 'Santiago, RM', phone: '966778899', gender: 'male', role: 'admin', activated: true)
User.create(first_name: 'Gordon', last_name: 'Ramsay', email: 'gordon_ramsay@gmail.com', password: '123123', role: 'cook', gender: 'male', activated: true)
User.create(first_name: 'Jamie', last_name: 'Oliver', email: 'jamie_oliver@gmail.com', password: '123123', role: 'cook', gender: 'male', activated: true)

Dish.create(name: 'Pizza', price: 10000, description: 'Pepperoni pizza', times_buyed: 8, created_at: DateTime.now, user_id: 3, active: true)
Dish.create(name: 'Hamburguer', price: 2000, description: 'A classic', times_buyed: 15, created_at: DateTime.now, user_id: 3, active: true)
Dish.create(name: 'Beer', price: 2500, description: 'Six pack of our best beer', times_buyed: 5, created_at: DateTime.now, user_id: 3, active: true)
Dish.create(name: 'Nachos', price: 2000, description: 'With cheese or guacamole dipping', times_buyed: 12, created_at: DateTime.now, user_id: 3, active: true)
Dish.create(name: 'McDonald\'s Szechuan Sauce', price: 800, description: 'The same taste since 1998', times_buyed: 73, created_at: DateTime.now, user_id: 3, active: true)
Dish.create(name: 'Rain Duck', price: 20000, description: 'The best wine for your steaks', times_buyed: 10, created_at: DateTime.now, user_id: 3, active: true)

Tag.create(name: 'Sushi')
Tag.create(name: 'JunkFood')
Tag.create(name: 'Alcohol')
Tag.create(name: 'Sauce')

Tagging.create(tag_id: 2, dish_id: 1)
Tagging.create(tag_id: 2, dish_id: 2)
Tagging.create(tag_id: 3, dish_id: 3)
Tagging.create(tag_id: 2, dish_id: 4)
Tagging.create(tag_id: 2, dish_id: 5)
Tagging.create(tag_id: 4, dish_id: 5)
Tagging.create(tag_id: 3, dish_id: 6)

Category.create(name: 'Wine')
Category.create(name: 'Mexican Food')
Category.create(name: 'Vegan')
Category.create(name: 'Meats')

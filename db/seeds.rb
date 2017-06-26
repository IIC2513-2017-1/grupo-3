# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin1 = User.create(first_name: 'Federico', last_name: 'Kunze', email: 'fekunze@uc.cl', password: '123123', address: 'Santiago, RM', phone: '922334455', gender: 'male', role: 'admin', activated: true, created_at: 4.weeks.ago)
admin2 = User.create(first_name: 'Gustavo', last_name: 'Antunes', email: 'gantunes@uc.cl', password: '123123', address: 'Santiago, RM', phone: '966778899', gender: 'male', role: 'admin', activated: true, created_at: 4.weeks.ago)
User.create(first_name: 'Gordon', last_name: 'Ramsay', email: 'gordon_ramsay@gmail.com', password: '123123', role: 'cook', gender: 'male', activated: true, created_at: 4.weeks.ago)
User.create(first_name: 'Jamie', last_name: 'Oliver', email: 'jamie_oliver@gmail.com', password: '123123', role: 'cook', gender: 'male', activated: true, created_at: 4.weeks.ago)
User.create(first_name: 'Client1', last_name: 'Tneilc', email: 'client1@eats.cl', password: '123123', role: 'client', address: 'Santiago, RM', phone: '999999999', gender: 'female', activated: true, created_at: 3.weeks.ago)
User.create(first_name: 'Client2', last_name: 'Tneilc', email: 'client2@eats.cl', password: '123123', role: 'client', address: 'Santiago, RM', phone: '999999999', gender: 'male', activated: true, created_at: 3.weeks.ago)
User.create(first_name: 'Client3', last_name: 'Tneilc', email: 'client3@eats.cl', password: '123123', role: 'client', address: 'Santiago, RM', phone: '999999999', gender: 'female', activated: true, created_at: 3.weeks.ago)
User.create(first_name: 'Client4', last_name: 'Tneilc', email: 'client4@eats.cl', password: '123123', role: 'client', address: 'Santiago, RM', phone: '999999999', gender: 'male', activated: true, created_at: 3.weeks.ago)
User.create(first_name: 'Client5', last_name: 'Tneilc', email: 'client5@eats.cl', password: '123123', role: 'client', address: 'Santiago, RM', phone: '999999999', gender: 'female', activated: true, created_at: 2.weeks.ago)
User.create(first_name: 'Client6', last_name: 'Tneilc', email: 'client6@eats.cl', password: '123123', role: 'client', address: 'Santiago, RM', phone: '999999999', gender: 'male', activated: true, created_at: 2.weeks.ago)
User.create(first_name: 'Client7', last_name: 'Tneilc', email: 'client7@eats.cl', password: '123123', role: 'client', address: 'Santiago, RM', phone: '999999999', gender: 'female', activated: true)
User.create(first_name: 'Client8', last_name: 'Tneilc', email: 'client8@eats.cl', password: '123123', role: 'client', address: 'Santiago, RM', phone: '999999999', gender: 'male', activated: true)
# 1
Dish.create(name: 'Pizza', price: 10000, description: 'Pepperoni pizza', times_buyed: 8, created_at: DateTime.now, user_id: 3, active: true)
# 2
Dish.create(name: 'Hamburguer', price: 2000, description: 'A classic', times_buyed: 15, created_at: DateTime.now, user_id: 3, active: true)
# 3
Dish.create(name: 'Beer', price: 2500, description: 'Six pack of our best beer', times_buyed: 5, created_at: DateTime.now, user_id: 3, active: true)
# 4
Dish.create(name: 'Nachos', price: 2000, description: 'With cheese or guacamole dipping', times_buyed: 12, created_at: DateTime.now, user_id: 3, active: true)
# 5
Dish.create(name: 'McDonald\'s Szechuan Sauce', price: 800, description: 'The same taste since 1998', times_buyed: 73, created_at: DateTime.now, user_id: 3, active: true)
# 6
Dish.create(name: 'Rain Duck', price: 20000, description: 'The best wine for your steaks', times_buyed: 10, created_at: DateTime.now, user_id: 3, active: true)
# 7
Dish.create(name: 'Baked Camembert', price: 5000, description: 'It is a Camembert. And it is BAKED. What more do you need to know?', times_buyed: 15, created_at: DateTime.now, user_id: 4, active: true)
# 8
Dish.create(name: 'Moules Marinières', price: 12500, description: 'The association between mussels and french fries is a Belgian specialty', times_buyed: 21, created_at: DateTime.now, user_id: 4, active: true)
# 9
Dish.create(name: 'Hachis Parmentier', price: 3500, description: 'A layer of mashed potatoes and a layer of juicy ground beef (or, as I like to call them, two layers of heaven).', times_buyed: 10, created_at: DateTime.now, user_id: 4, active: true)
# 10
Dish.create(name: 'Cheese Soufflé', price: 2500, description: 'The soufflé it must be gay, gay, gay. Like two butterflies dancing the waltz in the summer breeze.', times_buyed: 32, created_at: DateTime.now, user_id: 4, active: true)
# 11
Dish.create(name: 'Biryani', price: 3000, description: 'An aromatic rice dish cooked with several spices, notably saffron, and a protein (typically chicken or mutton) that\'s been marinated.', times_buyed: 20, created_at: DateTime.now, user_id: 4, active: true)
# 12
Dish.create(name: 'Momos', price: 3500, description: 'A variation on the traditional dimsum, native to the North Eastern states that border Nepal (where the dish originated), eaten with a fiery red chutney.', times_buyed: 10, created_at: DateTime.now, user_id: 4, active: true)
# 13
Dish.create(name: 'Idli', price: 3000, description: 'A heavy South Indian breakfast food. A fermented batter of ground rice and lentils, steamed in little circular moulds.', times_buyed: 12, created_at: DateTime.now, user_id: 4, active: true)
# 14
Dish.create(name: 'Nethili varuval', price: 2500, description: 'Anchovies dipped in a paste of turmeric and red chilies and fried, native to the South Indian region Chettinad.', times_buyed: 24, created_at: DateTime.now, user_id: 4, active: true)
# 15
Dish.create(name: 'Bistec a lo pobre', price: 2000, description: 'Beefsteak, french fries, fried onions, topped with a couple of fried eggs.', times_buyed: 42, created_at: DateTime.now, user_id: 4, active: true)
# 16
Dish.create(name: 'Humita', price: 1500, description: 'Boiled corn leaf rolls filled with seasoned ground corn.', times_buyed: 54, created_at: DateTime.now, user_id: 4, active: true)
# 17
Dish.create(name: 'Ensalada a la Chilena', price: 1000, description: 'Sliced tomatoes and onions with an oil dressing.', times_buyed: 12, created_at: DateTime.now, user_id: 4, active: true)
# 18
Dish.create(name: 'Sweet and Sour Pork', price: 4000, description: 'Sweet and sour pork has a bright orange-red color, and a delicious sweet and sour taste.', times_buyed: 2, created_at: DateTime.now, user_id: 4, active: true)
# 19
Dish.create(name: 'Palta Reina', price: 1000, description: 'An avocado half which is filled with tuna fish or ham and covered with mayonnaise. It is served on lettuce leaves, normally as an entree.', times_buyed: 51, created_at: DateTime.now, user_id: 4, active: true)
# 20
Dish.create(name: 'Gong Bao Chicken', price: 3000, description: 'This is a famous Sichuan-style specialty, popular with both Chinese and foreigners. The major ingredients are diced chicken, dried chili, and fried peanuts.', times_buyed: 13, created_at: DateTime.now, user_id: 4, active: true)
# 21
Dish.create(name: 'Gulab jaamun', price: 1200, description: 'Small balls of dried milk, slow cooked and boiled in a sugar syrup.', times_buyed: 48, created_at: DateTime.now, user_id: 4, active: true)

# 1
Discount.create(from_date: DateTime.now, to_date: DateTime.now + 1.month, discount_percent: 20, dish_id: 1, created_at: DateTime.now)
# 2
Discount.create(from_date: DateTime.now, to_date: DateTime.now.next_week, discount_percent: 10, dish_id: 20, created_at: DateTime.now)
# 3
Discount.create(from_date: DateTime.now, to_date: DateTime.now + 2.month, discount_percent: 50, dish_id: 5, created_at: DateTime.now)
# 4
Discount.create(from_date: DateTime.now, to_date: DateTime.now.next_week, discount_percent: 15, dish_id: 18, created_at: DateTime.now)

Tag.create(name: 'Sushi')               # 1
Tag.create(name: 'JunkFood')            # 2
Tag.create(name: 'Alcohol')             # 3
Tag.create(name: 'Sauce')               # 4

Tagging.create(tag_id: 2, dish_id: 1)
Tagging.create(tag_id: 2, dish_id: 2)
Tagging.create(tag_id: 3, dish_id: 3)
Tagging.create(tag_id: 2, dish_id: 4)
Tagging.create(tag_id: 2, dish_id: 5)
Tagging.create(tag_id: 4, dish_id: 5)
Tagging.create(tag_id: 3, dish_id: 6)

Category.create(name: 'Wine')           # 1
Category.create(name: 'Mexican Food')   # 2
Category.create(name: 'Vegan')          # 3
Category.create(name: 'Meats')          # 4
Category.create(name: 'Sea Dood')       # 5
Category.create(name: 'Fast Food')      # 6
Category.create(name: 'Indian Food')    # 7
Category.create(name: 'French Food')    # 8
Category.create(name: 'Italian Food')   # 9
Category.create(name: 'Chilean Food')  # 10
Category.create(name: 'Chinese Food')  # 11


Categorizing.create(category_id: 1, dish_id: 6)
Categorizing.create(category_id: 6, dish_id: 1)
Categorizing.create(category_id: 6, dish_id: 2)
Categorizing.create(category_id: 6, dish_id: 4)
Categorizing.create(category_id: 6, dish_id: 5)
Categorizing.create(category_id: 8, dish_id: 7)
Categorizing.create(category_id: 8, dish_id: 8)
Categorizing.create(category_id: 8, dish_id: 9)
Categorizing.create(category_id: 8, dish_id: 10)
Categorizing.create(category_id: 9, dish_id: 11)
Categorizing.create(category_id: 9, dish_id: 12)
Categorizing.create(category_id: 9, dish_id: 13)
Categorizing.create(category_id: 9, dish_id: 14)
Categorizing.create(category_id: 10, dish_id: 15)
Categorizing.create(category_id: 10, dish_id: 16)
Categorizing.create(category_id: 10, dish_id: 17)
Categorizing.create(category_id: 10, dish_id: 19)
Categorizing.create(category_id: 11, dish_id: 21)
Categorizing.create(category_id: 11, dish_id: 18)
Categorizing.create(category_id: 11, dish_id: 20)

admin1.generate_api_token_and_save
admin2.generate_api_token_and_save

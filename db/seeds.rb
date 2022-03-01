# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
joe = Chef.create!(name: "Joe Galvin")

dish1 = joe.dishes.create!(name: "Bacon Poppers", description: "words")
dish2 = joe.dishes.create!(name: "Turkey truck", description: "more words")

ing1 = Ingredient.create(name: "sugar", calorie: 25)
ing2 = Ingredient.create(name: "lotsasugar", calorie: 75)
ing3 = Ingredient.create(name: "fat", calorie: 100)
ing4 = Ingredient.create(name: "morefat", calorie: 200)
ing5 = Ingredient.create(name: "bacon", calorie: 300)

dish_ing1 = DishIngredient.create(dish_id: dish1.id, ingredient_id: ing1.id)
dish_ing1 = DishIngredient.create(dish_id: dish1.id, ingredient_id: ing2.id)
dish_ing1 = DishIngredient.create(dish_id: dish1.id, ingredient_id: ing3.id)
dish_ing1 = DishIngredient.create(dish_id: dish2.id, ingredient_id: ing1.id)
dish_ing1 = DishIngredient.create(dish_id: dish2.id, ingredient_id: ing4.id)
dish_ing1 = DishIngredient.create(dish_id: dish2.id, ingredient_id: ing5.id)
dish_ing1 = DishIngredient.create(dish_id: dish2.id, ingredient_id: ing3.id)

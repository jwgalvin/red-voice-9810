require 'rails_helper'

describe "is a show page" do

  before(:each)   do
    @joe = Chef.create!(name: "Joe Galvin")
    @joenot = Chef.create!(name: "NotJoe Galvin")

    @dish1 = @joe.dishes.create!(name: "Bacon Poppers", description: "words")
    @dish2 = @joe.dishes.create!(name: "Turkey truck", description: "more words")

    @ing1 =Ingredient.create(name: "sugar", calorie: 25)
    @ing2 =Ingredient.create(name: "lotsasugar", calorie: 75)
    @ing3 =Ingredient.create(name: "fat", calorie: 100)
    @ing4 =Ingredient.create(name: "fat", calorie: 200)
    @ing5 =Ingredient.create(name: "bacon", calorie: 300)

    @dish_ing1 = DishIngredient.create(dish_id: @dish1.id, ingredient_id: @ing1.id)
    @dish_ing1 = DishIngredient.create(dish_id: @dish1.id, ingredient_id: @ing2.id)
    @dish_ing1 = DishIngredient.create(dish_id: @dish1.id, ingredient_id: @ing3.id)
    @dish_ing1 = DishIngredient.create(dish_id: @dish2.id, ingredient_id: @ing1.id)
    @dish_ing1 = DishIngredient.create(dish_id: @dish2.id, ingredient_id: @ing4.id)
    @dish_ing1 = DishIngredient.create(dish_id: @dish2.id, ingredient_id: @ing5.id)
    @dish_ing1 = DishIngredient.create(dish_id: @dish2.id, ingredient_id: @ing3.id)
  end
  it "Has a name and description" do
  end
end

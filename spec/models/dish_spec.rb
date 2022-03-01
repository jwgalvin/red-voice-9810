require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many(:dish_ingredients)}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end
  describe "tests model methods" do
    before(:each)   do
      @joe = Chef.create!(name: "Joe Galvin")
      @joenot = Chef.create!(name: "NotJoe Galvin")

      @dish1 = @joe.dishes.create!(name: "Bacon Poppers", description: "words")
      @dish2 = @joe.dishes.create!(name: "Turkey truck", description: "more words")
      @dish3 = @joenot.dishes.create!(name: "Toy truck", description: "some words")

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
      @dish_ing1 = DishIngredient.create(dish_id: @dish3.id, ingredient_id: @ing5.id)
      @dish_ing1 = DishIngredient.create(dish_id: @dish3.id, ingredient_id: @ing3.id)
    end

    it "accuratley counts calories" do
      expect(@dish1.calorie_count).to eq(200)
      expect(@dish2.calorie_count).to eq(225)
    end

    it "tests find_chef" do
      expect(@dish1.find_chef).to eq(@joe)
      expect(@dish3.find_chef).to_not eq(@joe)
    end
  end
end

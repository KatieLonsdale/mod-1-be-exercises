require 'rspec'
require './lib/potluck'
require './lib/dish'

RSpec.describe do
  describe '#initialize' do
    it 'exists' do
      potluck = Potluck.new('7-13-18')

      expect(potluck).to be_instance_of(Potluck)
    end

    it 'has attributes' do
      potluck = Potluck.new('7-13-18')

      expect(potluck.date).to eq('7-13-18')
      expect(potluck.dishes).to eq([])
    end
  end

  describe '#add_dish' do
    it 'adds dish to dishes' do
      potluck = Potluck.new('7-13-18')
      couscous_salad = Dish.new('Couscous Salad', :appetizer)
      cocktail_meatballs = Dish.new('Cocktail Meatballs', :entree)

      expect(potluck.add_dish(couscous_salad)).to eq(potluck.dishes)
      expect(potluck.add_dish(cocktail_meatballs)).to eq(potluck.dishes)

      expect(couscous_salad).to be_instance_of(Dish)
      expect(potluck.dishes).to be_instance_of(Array)
      expect(potluck.dishes).to eq([couscous_salad, cocktail_meatballs])
      expect(potluck.dishes.length).to eq 2
    end
  end

  describe '#get all from category' do
    it 'returns all dishes in given category' do
      potluck = Potluck.new("7-13-18")
      couscous_salad = Dish.new("Couscous Salad", :appetizer)
      summer_pizza = Dish.new("Summer Pizza", :appetizer)
      roast_pork = Dish.new("Roast Pork", :entree)
      cocktail_meatballs = Dish.new("Cocktail Meatballs", :entree)
      candy_salad = Dish.new("Candy Salad", :dessert)

      potluck.add_dish(couscous_salad)
      potluck.add_dish(summer_pizza)
      potluck.add_dish(roast_pork)
      potluck.add_dish(cocktail_meatballs)
      potluck.add_dish(candy_salad)

      expect(potluck.get_all_from_category(:appetizer)).to eq([couscous_salad, summer_pizza])
      expect(potluck.get_all_from_category(:entree)).to eq([roast_pork, cocktail_meatballs])
      expect(potluck.get_all_from_category(:dessert)).to eq([candy_salad])
      expect(potluck.get_all_from_category(:appetizer).first).to eq(couscous_salad)
      expect(potluck.get_all_from_category(:appetizer).first.name).to eq('Couscous Salad')
    end
  end
end
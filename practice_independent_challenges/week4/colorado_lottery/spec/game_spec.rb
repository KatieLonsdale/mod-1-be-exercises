require './lib/contestant'
require "./lib/game"
require 'rspec'

RSpec.describe do 
  before(:each) do
    @pick_4 = Game.new('Pick 4', 2)
    @mega_millions = Game.new('Mega Millions', 5, true)
  end

  describe '#initialize' do
    it 'exists' do
      expect(@pick_4).to be_a Game
      expect(@mega_millions).to be_a Game
    end

    it 'has a name' do
      expect(@mega_millions.name).to eq('Mega Millions')
    end

    it 'has a cost' do
      expect(@mega_millions.cost).to eq 5
    end

    it 'is not a national drawing by default' do
      expect(@pick_4.national_drawing?).to be false
    end

    it 'can be a national drawing' do
      expect(@mega_millions.national_drawing?).to be true
    end
  end
end
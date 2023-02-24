require './lib/contestant'
require "./lib/game"
require 'rspec'

RSpec.describe do
  before(:each) do
    @alexander = Contestant.new({first_name: 'Alexander',
                                      last_name: 'Aigiades',
                                      age: 28,
                                      state_of_residence: 'CO',
                                      spending_money: 10})
  end

  describe '#initialize' do
    it 'exists' do
      expect(@alexander).to be_a Contestant
    end

    it 'has a full name' do
      expect(@alexander.full_name).to eq ('Alexander Aigiades')
    end

    it 'has an age' do
      expect(@alexander.age).to eq 28
    end

    it 'has a state' do
      expect(@alexander.state_of_residence).to eq('CO')
    end

    it 'has spending money' do
      expect(@alexander.spending_money).to eq 10
    end

    it 'has empty game interests by default' do
      expect(@alexander.game_interests).to eq ([])
    end
  end

  describe '#out_of_state?' do
    it 'is out of state if not CO' do
      expect(@alexander.out_of_state?).to be false
    end
  end

  describe '#add_game_interest' do
    it 'adds game to game interests' do
      @alexander.add_game_interest('Mega Millions')
      @alexander.add_game_interest('Pick 4')
      expect(@alexander.game_interests).to eq(["Mega Millions", "Pick 4"])
    end
  end

  # describe
end
require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'

RSpec.describe do
  describe '#initialize' do
    it 'exists and has attributes' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)

      expect(round).to be_instance_of(Round)
      expect(round.deck).to eq(deck)
    end

    it 'has no turns by default' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)

      expect(round.turn_number).to eq 1
      expect(round.turns).to eq []
    end
  end

  describe '::tracking' do
    it 'creates new turn each time you take a turn' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)

      new_turn = round.take_turn('Juneau')

      expect(new_turn.class).to eq Turn
      expect(round.turns).to eq([new_turn])
    end

    it 'tracks current card' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)

      expect(round.current_card).to eq(card_1)

      new_turn = round.take_turn('Juneau')

      expect(round.current_card).to eq(card_2)

      new_turn_2 = round.take_turn('Venus')

      expect(round.current_card).to eq(card_3)
    end

    
    it 'tracks number of turns' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)
      
      new_turn = round.take_turn('Juneau')
      
      expect(round.turns).to eq [new_turn]
      expect(round.turn_number).to eq 2
      
      new_turn_2 = round.take_turn('Venus')
      
      expect(round.turns).to eq [new_turn, new_turn_2]
      expect(round.turn_number).to eq 3
    end
  end

  describe '::results' do
    it 'evaluates answer' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)
  
      new_turn = round.take_turn('Juneau')
  
      expect(new_turn.correct?).to be true
    end

    it 'returns your score' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)

      new_turn = round.take_turn('Juneau')

      expect(round.number_correct).to eq 1
      expect(round.turns.last.feedback).to eq('Correct.')

      new_turn_2 = round.take_turn('Venus')

      expect(round.turns.last.feedback).to eq('Incorrect.')
      expect(round.number_correct).to eq 1
      expect(round.percent_correct).to eq 50.0
    end

    it 'returns score by category' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)

      new_turn = round.take_turn('Juneau')

      new_turn_2 = round.take_turn('Venus')
      
      expect(round.number_correct_by_category(:Geography)).to eq 1
      expect(round.number_correct_by_category(:STEM)).to eq 0
      expect(round.percent_correct_by_category(:Geography)).to eq 100.0
    end
  end

end


class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    deck.cards[@turns.count]
  end

  def take_turn(guess)
    current_turn = Turn.new(guess, self.current_card)
    turns.push(current_turn)
    current_turn
  end

end
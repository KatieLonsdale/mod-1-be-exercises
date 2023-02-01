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
    @turns.push(self.current_card)
    Turn.new(guess, self.current_card)
  end

end
class Round
  attr_reader :deck, :turns, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
  end

  def current_card
    deck.cards[@turns.count]
  end

  def take_turn(guess)
    current_turn = Turn.new(guess, self.current_card)
    turns.push(current_turn)
    @number_correct += 1 if current_turn.correct? == true
    current_turn
  end

  def percent_correct
    (@number_correct.to_f) / (@turns.count.to_f) * 100
  end

end
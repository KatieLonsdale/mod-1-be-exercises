class Turn
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    self.guess == card.answer ? true : false
  end

  def feedback
    self.guess == card.answer ? "Correct!" : "Incorrect."
  end
end
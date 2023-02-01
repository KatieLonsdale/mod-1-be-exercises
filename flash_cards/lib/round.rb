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

  def number_correct
    number_right = 0
    @turns.each do |turn|
      if turn.correct? == true
      number_right += 1
      else
      end
    end
    number_right
  end

  def percent_correct
    number_right = 0
    @turns.each do |turn|
      if turn.correct? == true
        number_right += 1
      else
      end
    end
    (number_right.to_f) / (@turns.count.to_f) * 100
  end

  def number_correct_by_category(category)
    number_right = 0
    @turns.each do |turn|
      if turn.correct? == true && turn.card.category == category
      number_right += 1
      else
      end
    end
    number_right
  end

  def percent_correct_by_category(category)
    number_right = 0
    total_number = 0
    @turns.each do |turn|
      if turn.correct? == true && turn.card.category == category
      number_right += 1
      else
      end
    end
    @turns.each do |turn|
      if turn.card.category == category
        total_number += 1
      else 
      end
    end
    (number_right.to_f) / (total_number.to_f) * 100
  end
end
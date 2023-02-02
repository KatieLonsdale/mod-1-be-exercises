require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'
require './lib/card_generator'
require 'rspec'

def start
  filename = "spec/cards.txt"
  cards = CardGenerator.new(filename)

  deck_1 = Deck.new(cards.cards)

  round_1 = Round.new(deck_1)

  puts "Welcome! You're playing with #{deck_1.count} cards."
  puts '-------------------------------------------------'

  puts "This is card number #{round_1.turn_number} out of #{deck_1.count}."
  puts "Question: #{round_1.current_card.question}"
  guess_1 = gets.chomp
  turn_1 = Turn.new(guess_1,deck_1.cards[0])
  round_1.take_turn(guess_1)
  puts turn_1.feedback

  puts "This is card number #{round_1.turn_number} out of #{deck_1.count}."
  puts "Question: #{round_1.current_card.question}"
  guess_2 = gets.chomp
  turn_2 = Turn.new(guess_2,deck_1.cards[1])
  round_1.take_turn(guess_2)
  puts turn_2.feedback

  puts "This is card number #{round_1.turn_number} out of #{deck_1.count}."
  puts "Question: #{round_1.current_card.question}"
  guess_3 = gets.chomp
  turn_3 = Turn.new(guess_3,deck_1.cards[2])
  round_1.take_turn(guess_3)
  puts turn_3.feedback

  puts "This is card number #{round_1.turn_number} out of #{deck_1.count}."
  puts "Question: #{round_1.current_card.question}"
  guess_4 = gets.chomp
  turn_4 = Turn.new(guess_4,deck_1.cards[3])
  round_1.take_turn(guess_4)
  puts turn_4.feedback

  puts '****** Game over! ******'
  # need to figure out how to fix categories
  puts "You had #{round_1.number_correct} correct guesses out of #{round_1.turns.count} for a total score of #{round_1.percent_correct}%."
  puts "Geography - #{round_1.percent_correct_by_category(:Geography)}% correct"
  puts "Math - #{round_1.percent_correct_by_category(:Math)}% correct"
  puts "Biology - #{round_1.percent_correct_by_category(:Biology)}% correct"
end

start
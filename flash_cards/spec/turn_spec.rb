require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new('The guess.', card)

    expect(turn).to be_instance_of(Turn)
  end

  it 'has a guess' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new('The guess.', card)

    expect(turn.guess).to eq('The guess.')
  end

  it 'has a card' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new('The guess.', card)

    expect(turn.card).to eq(card)
  end

  it 'tells you if the guess is right' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new('The guess.', card)

    expect(turn.correct?).to be false

    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new('Juneau', card)

    expect(turn.correct?).to be false
  end

  it 'returns the result' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new('The guess.', card)

    expect(turn.feedback).to eq('Incorrect.')

    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new('Juneau', card)

    expect(turn.feedback).to eq('Correct!')
  end
end
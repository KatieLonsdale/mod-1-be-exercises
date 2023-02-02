require './lib/card_generator'
require 'rspec'
require './lib/card'

RSpec.describe CardGenerator do
  it 'exists' do
    filename = "spec/cards.txt"
    cards = CardGenerator.new(filename)

    expect(cards).to be_instance_of(CardGenerator)
    expect(cards.filename).to eq("spec/cards.txt")
  end

  it 'is an array' do
    filename = "spec/cards.txt"
    cards = CardGenerator.new(filename)

    expect(cards.cards).to be_an(Array)
  end

  it 'creates an instance of card' do
    filename = "spec/cards.txt"
    cards = CardGenerator.new(filename)

    expect(cards.cards.first).to be_instance_of(Card)
  end

end
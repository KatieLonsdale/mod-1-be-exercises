# * Passing data into `initialize`
# * Using methods to change the internal state of an instance
# * Using methods to query the internal state of an instance
# * Functionality that necessitates the internal use of an Array

require './spec/spec_helper'
require './lib/hydra'

RSpec.describe Hydra do
    # it 'has a name' do
    #     hydra = Hydra.new('Hank')
    #     expect(hydra.name).to eq('Hank')
    # end

    # it 'is a color' do
    #     hydra = Hydra.new('Hank', 'blue')
    #     expect(hydra.name).to eq('Hank')
    #     expect(hydra.color).to eq('blue')
    # end

    # it 'is purple by default' do
    #     hydra = Hydra.new('Hank')
    #     expect(hydra.name).to eq('Hank')
    #     expect(hydra.color). to eq('purple')
    # end

    # it 'has one head when created' do
    #     hydra = Hydra.new('Hank')
    #     expect(hydra.heads). to eq(1)
    # end

    # it 'starts with no opponents' do
    #     hydra = Hydra.new('Hank')
    #     expect(hydra.opponents). to be_empty
    # end

    # it 'gains an opponent when a warrior appears' do
    #     hydra = Hydra.new('Hank')
    #     opponent = Warrior.new('Hercules')

    #     hydra.appears(opponent)

    #     expect(hydra.opponents.count). to eq(1)
    #     expect(hydra.opponents.first.name). to eq('Hercules')
    #     expect(hydra.opponents.first).to be_an_instance_of(Warrior)
    # end

    # it 'can have multiple opponents' do
    #     hydra = Hydra.new('Hank')
    #     opponent = Warrior.new('Hercules')
    #     opponent_2 = Warrior.new('Iolaus')

    #     hydra.appears(opponent)
    #     hydra.appears(opponent_2)

    #     expect(hydra.opponents.count). to eq(2)
    #     hydra.opponents.each{|opponent| expect(opponent).to be_an_instance_of(Warrior)}
    # end

    # it 'cannot be attacked by a hiding warrior' do
    #     hydra = Hydra.new('Hank')
    #     opponent = Warrior.new('Hercules')

    #     expect(opponent.attack(hydra)).to eq('Show yourself!')
    #     expect(opponent.attack_count).to eq(0)
    #     expect(opponent.fight_status).to be false
    # end

    it 'is beheaded every third attack by the same warrior' do
        hydra = Hydra.new('Hank')
        opponent = Warrior.new('Hercules')

        hydra.appears(opponent)

        expect(hydra.opponents.count). to eq(1)
        expect(hydra.opponents.first.name). to eq('Hercules')
        expect(hydra.opponents.first).to be_an_instance_of(Warrior)
        expect(opponent.fight_status).to be true

        3.times {opponent.attack(hydra)}

        expect(opponent.attack_count).to eq(3)
        expect(hydra.beheaded_count).to eq(1)
        expect(hydra.heads).to eq(2)
    end

    it 'is beheaded on 6th attack by same warrior' do
        hydra = Hydra.new('Hank')
        opponent = Warrior.new('Hercules')

        hydra.appears(opponent)
        6.times{opponent.attack(hydra)}

        expect(hydra.beheaded_count).to eq(2)
        expect(hydra.heads).to eq(3)
        expect(opponent.attack_count).to eq(6)
    end

    it 'is killed when beheaded 7 times' do
        hydra = Hydra.new('Hank')
        opponent = Warrior.new('Hercules')

        hydra.appears(opponent)

        5.times{opponent.attack(hydra)}
        expect(hydra.beheaded_count). to eq(1)
        expect(hydra.heads). to eq(2)
        expect(hydra.dead?). to be false

        7.times{opponent.attack(hydra)}
        expect(hydra.beheaded_count). to eq(4)
        expect(hydra.heads). to eq(5)
        expect(hydra.dead?). to be false

        9.times{opponent.attack(hydra)}
        expect(hydra.beheaded_count). to eq(7)
        expect(hydra.dead?). to be true
    end
end
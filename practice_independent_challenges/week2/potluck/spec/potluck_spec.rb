require 'rspec'
require './lib/potluck'
require './lib/dish'

RSpec.describe do
  describe '#initialize' do
    it 'exists' do
      potluck = Potluck.new('7-13-18')

      expect(potluck).to be_instance_of(Potluck)
    end

    it 'has attributes' do
      potluck = Potluck.new('7-13-18')

      expect(potluck.date).to eq('7-13-18')
      expect(potluck.dishes).to eq([])
    end
  end
end
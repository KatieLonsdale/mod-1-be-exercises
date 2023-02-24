require './lib/room'
require 'rspec'

RSpec.describe Room do
  describe '#initialize' do
    it 'exists' do
      bathroom = Room.new('bathroom')

      expect(bathroom).to be_an_instance_of Room
    end

    it '#name' do
      bathroom = Room.new('bathroom')

      name = bathroom.name

      expect(name).to eq('bathroom')
    end
  end
end
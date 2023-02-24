require './lib/room'
require './lib/apartment'
require 'rspec'

RSpec.describe Apartment do
  before(:each) do
    @apartment = Apartment.new
    @bathroom = Room.new("bathroom")
    @laundry = Room.new("laundry")
    @kitchen = Room.new("kitchen")
    @bedroom = Room.new("bedroom")

  end
  describe '#initialize' do
    it 'exists' do
      expect(@apartment).to be_an_instance_of Apartment
    end

    it 'is not rented by default' do
      rent_status = @apartment.is_rented?

      expect(rent_status).to be false
    end
  end

  describe '#is_rented?' do
    it 'returns rent status' do
      expect(@apartment.is_rented?).to be false
    end
  end

  describe '#rent' do
    it 'changes rent status' do
      expect(@apartment.is_rented?).to be false
      
      @apartment.rent

      expect(@apartment.is_rented?).to be true
    end
  end

  describe '#add_room' do
    it 'adds a room to rooms attribute' do
      @apartment.add_room(@bathroom)
      @apartment.add_room(@laundry)
      @apartment.add_room(@kitchen)
      @apartment.add_room(@bedroom)

      expect_rooms = [@bathroom, @laundry, @kitchen, @bedroom]

      expect(@apartment.rooms).to eq(expect_rooms) 
    end

    it 'has up to four rooms' do
      dining_room = Room.new('dining room')

      @apartment.add_room(@bathroom)
      @apartment.add_room(@laundry)
      @apartment.add_room(@kitchen)
      @apartment.add_room(@bedroom)
      
      expect(@apartment.add_room(dining_room)).to eq('No more space.')

      expect_rooms = [@bathroom, @laundry, @kitchen, @bedroom]

      expect(@apartment.rooms).to eq(expect_rooms)
    end
  end

  describe '#list_rooms_by_name_alphabetically' do
    it 'lists rooms by name alphabetically' do
      @apartment.add_room(@bathroom)
      @apartment.add_room(@laundry)
      @apartment.add_room(@kitchen)
      @apartment.add_room(@bedroom)

      expect(@apartment.list_rooms_by_name_alphabetically).
      to eq(["bathroom", "bedroom", "kitchen", "laundry"])
    end
  end
end
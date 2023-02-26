require 'pry'
require 'rspec'
require './lib/event_manager'
require './lib/attendee'
require 'csv'

describe EventManager do
  before(:each) do
    @event_manager = EventManager.new('./data/event_attendees.csv')
  end
  describe '#initialize' do
    it 'exists' do
      expect(@event_manager).to be_a EventManager
    end

    it 'has a CSV file' do
      expect(@event_manager.file).to eq('./data/event_attendees.csv')
    end

    it 'has an empty array of attendees by default' do
      expect(@event_manager.attendees).to eq([])
    end
  end

  describe '#access_column' do
    it 'accesses a column from the file' do
      first_names = ["Allison", "SArah", "Sarah","David","Chris","Aya",
      "Mary Kate","Audrey","Shiyu","Eli","Colin","Megan","Meggie","Laura",
      "Paul","Shannon","Shannon","Nash","Amanda"]

      expect(@event_manager.access_column(:first_name)).to eq(first_names)
    end
  end

  describe '#create_attendees' do
    it 'creates an array of attendee objects' do
      expect(@event_manager.create_attendees).to be_a Array
      expect(@event_manager.create_attendees.sample).to be_a Attendee
    end

    it 'saves attendees to attribute array' do
      @event_manager.create_attendees
      expect(@event_manager.attendees.empty?).to be false
    end
  end

  describe '#display_attendees' do
    it 'displays attributes of attendees' do
      @event_manager.create_attendees
      expect(@event_manager.display_attendees).to be_a Array
      expect(@event_manager.display_attendees.sample).to be_a String
    end
  end
end
require './lib/reunion'
require './lib/activity'

RSpec.describe Reunion do
  before(:each) do
    @reunion = Reunion.new("1406 BE")
    @activity_1 = Activity.new("Brunch")
    @activity_2 = Activity.new('Movies')
  end

  describe '#initialize' do
    it 'exists and has attributes' do
      expect(@reunion).to be_a Reunion
      expect(@reunion.name).to eq('1406 BE')
      expect(@reunion.activities).to eq([])
    end
  end

  describe '#add_activity' do
    it 'adds an activity object to activities array' do
      @reunion.add_activity(@activity_1)

      expect(@reunion.activities).to eq([@activity_1])
    end
  end

  describe '#total_cost_of_reunion' do
    it 'returns total cost of the reunion' do
      @reunion.add_activity(@activity_1)
      
      @activity_1.add_participant("Maria", 20)
      @activity_1.add_participant("Luther", 40)
      
      expect(@reunion.total_cost_of_reunion).to eq 60

      @reunion.add_activity(@activity_2)

      @activity_2.add_participant("Maria", 5)
      @activity_2.add_participant("Luther", 15)

      expect(@reunion.total_cost_of_reunion).to eq 80
    end
  end

  describe '#each_participant_owes' do
    it 'returns each participant and what they owe for activities' do
      @reunion.add_activity(@activity_1)
      @activity_1.add_participant("Maria", 20)
      @activity_1.add_participant("Luther", 40)
      
      @reunion.add_activity(@activity_2)
      @activity_2.add_participant("Maria", 5)
      @activity_2.add_participant("Luther", 15)

      expect(@reunion.each_participant_owes).
      to eq({'Maria' => 15, 'Luther' => -15})
    end
  end

  describe '#print_receipt' do
    it 'prints out receipt' do
      @reunion.add_activity(@activity_1)
      @activity_1.add_participant("Maria", 20)
      @activity_1.add_participant("Luther", 40)
      
      @reunion.add_activity(@activity_2)
      @activity_2.add_participant("Maria", 5)
      @activity_2.add_participant("Luther", 15)
      
      @reunion.print_receipt
    end
  end
end
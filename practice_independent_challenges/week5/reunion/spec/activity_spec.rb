require './lib/activity'

RSpec.describe Activity do
  before(:each) do
    @activity = Activity.new("Brunch")
  end

  describe '#initialize' do
    it 'exists and has attributes' do
      expect(@activity).to be_a Activity
      expect(@activity.name).to eq('Brunch')
      expect(@activity.participants).to eq({})
    end
  end

  describe '#add_participant' do
    it 'adds participant and age to partcipants hash' do
      @activity.add_participant("Maria", 20)
      expect(@activity.participants).to eq({"Maria" => 20})

      @activity.add_participant("Luther", 40)
      expect(@activity.participants).to eq({"Maria" => 20, "Luther" => 40})
    end
  end

  describe '#total_cost' do
    it 'returns amount all participants have paid' do
      @activity.add_participant("Maria", 20)
      @activity.add_participant("Luther", 40)

      expect(@activity.total_cost).to eq(60)
    end
  end

  describe '#split' do
    it 'returns how much each participant owes if bill is split evenly' do
      @activity.add_participant("Maria", 20)
      @activity.add_participant("Luther", 40)

      expect(@activity.split).to eq 30
    end
  end

  describe '#owed' do
    it 'returns how much each participant owes or is owed' do
      @activity.add_participant("Maria", 20)
      @activity.add_participant("Luther", 40)

      expect(@activity.owed).to eq({"Maria" => 10, "Luther" => -10})
    end
  end
end
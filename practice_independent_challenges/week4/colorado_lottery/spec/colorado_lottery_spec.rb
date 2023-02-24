require './lib/contestant'
require "./lib/game"
require './lib/colorado_lottery'
require 'rspec'

RSpec.describe do 
  before (:each) do
    lottery = ColoradoLottery.new
  end

  it "#initialize" do
    it 'exists' do
      expect(lottery).to be_a ColoradoLottery
    end

    it 'has registered contestants' do
      expect(lottery.registered_contestants).to eq({})
    end

    it 'has winners' do
      expect(lottery.winners).to eq([])
    end

    it 'has current_contestants' do
      expect(lottery.current_contestants).to eq({})
    end
  end
end
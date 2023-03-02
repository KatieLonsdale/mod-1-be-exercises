require 'rspec'
require './lib/bob'
require './lib/paint'

RSpec.describe Bob do
  describe 'Instantiation' do
    it 'exists' do
      bob = Bob.new

      expect(bob).to be_an_instance_of(Bob)
    end

    it 'starts with no paints' do
      bob = Bob.new

      expect(bob.paints).to eq([])
    end
  end

  describe 'Methods' do
    it 'can add paint' do
      bob = Bob.new
      paint_1 = double("paint 1")
      paint_2 = double()
      # mock for paint

      bob.add_paint(paint_1)
      bob.add_paint(paint_2)

      expect(bob.paints).to eq([paint_1, paint_2])
    end

    it 'can return paint colors' do
      bob = Bob.new
      paint_1 = double("paint 1")
      paint_2 = double()

      bob.add_paint(paint_1)
      bob.add_paint(paint_2)

      allow(paint_1).to receive(:color).and_return('Alizarin Crimson')
      allow(paint_2).to receive(:color).and_return('Van Dyke Brown')
      # stubs

      expect(bob.paint_colors).to eq(["Alizarin Crimson", "Van Dyke Brown"])
    end

    it 'can calculate total paint amount' do
      bob = Bob.new
      # paint_1 = Paint.new("Alizarin Crimson", 42)
      # paint_2 = Paint.new("Van Dyke Brown", 25)

      paint_1 = double("paint 1")
      paint_2 = double()

      bob.add_paint(paint_1)
      bob.add_paint(paint_2)

      allow(paint_1).to receive(:amount).and_return(32)
      allow(paint_2).to receive(:amount).and_return(35)

      expect(bob.total_paint_amount).to eq(67)
    end
  end
end

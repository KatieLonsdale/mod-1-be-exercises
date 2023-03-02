require 'rspec'
require './lib/image_generator'

RSpec.describe ImageGenerator do
  describe '#initialize' do
    it 'exists' do
      image_generator = ImageGenerator.new(2500)
      expect(image_generator).to be_a ImageGenerator
    end

    it 'has attributes' do
      image_generator = ImageGenerator.new(2500)
      expect(image_generator.max_image_size).to eq 2500
    end

    # Using stubs write the tests to confirm the functionality
    # that exists in ./lib/image_generator.rb
  end

  describe '#generate_images' do
    it 'generates images' do
      image_generator = ImageGenerator.new(2500)
      allow(image_generator).to receive(:rand).and_return(100)

      expect(image_generator.generate_images.count).to eq 100
    end
  end

  describe '#change_max_size' do
    it 'changes the max image size' do
      image_generator = ImageGenerator.new(2500)
      allow(image_generator).to receive(:rand).and_return(500)
      image_generator.change_max_size(2)

      expect(image_generator.max_image_size).to eq 1000
    end
  end
end

require 'spec_helper'

RSpec.describe Curator do
  before(:each) do
    @curator = Curator.new
    @photo_1 = Photograph.new({
     id: "1",      
     name: "Rue Mouffetard, Paris (Boy with Bottles)",      
     artist_id: "1",      
     year: "1954"      
    })        
    @photo_2 = Photograph.new({
     id: "2",      
     name: "Moonrise, Hernandez",      
     artist_id: "2",      
     year: "1941"      
    })
  end
  describe '#initialize' do
    it 'exists' do
      expect(@curator).to be_a Curator
    end
    it 'has an empty array of photographs by default' do
      expect(@curator.photographs).to eq([])
      expect(@curator.photographs).to be_a Array
    end
  end
  describe '#add_photograph' do
    it 'adds given photo to photographs array' do
      @curator.add_photograph(@photo_1)
      @curator.add_photograph(@photo_2)

      expect(@curator.photographs).to eq([@photo_1, @photo_2])
      expect(@curator.photographs.count).to eq 2
    end
  end
end
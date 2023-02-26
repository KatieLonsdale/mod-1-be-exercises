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
    @artist_1 = Artist.new({
    id: "1",      
    name: "Henri Cartier-Bresson",      
    born: "1908",      
    died: "2004",      
    country: "France"      
    })        
    @artist_2 = Artist.new({
    id: "2",      
    name: "Ansel Adams",      
    born: "1902",      
    died: "1984",      
    country: "United States"      
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
    it 'has an empty array of artists by default' do
      expect(@curator.artists).to eq([])
      expect(@curator.artists).to be_a Array

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

  describe '#add_artist' do
    it 'adds given artist to artists array' do
      @curator.add_artist(@artist_1)
      @curator.add_artist(@artist_2)

      expect(@curator.artists).to eq([@artist_1, @artist_2])
      expect(@curator.artists.count).to eq 2
    end
  end

  describe '#find_artist_by_id' do
    it 'finds added artist by their id' do
      @curator.add_artist(@artist_1)
      @curator.add_artist(@artist_2)

      expect(@curator.find_artist_by_id('1')).to eq(@artist_1)
    end
  end

  describe '#collection' do
    it 'returns list of all artists and their photographs' do
      @curator.add_photograph(@photo_1)
      @curator.add_photograph(@photo_2)
      @curator.add_artist(@artist_1)
      @curator.add_artist(@artist_2)

      expect(@curator.collection).to be_a Hash
      expect(@curator.collection).to eq({@artist_1 => [@photo_1], @artist_2 => [@photo_2]})
    end
  end
end
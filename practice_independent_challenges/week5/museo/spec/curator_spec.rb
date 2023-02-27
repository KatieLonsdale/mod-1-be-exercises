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
    @photo_3 = Photograph.new({
      id: "3",      
      name: "Big Rock Candy Mountain",      
      artist_id: "2",      
      year: "1967"      
     })
    @photo_4 = Photograph.new({
      id: "4",      
      name: "Le Fromage",      
      artist_id: "1",      
      year: "1954"      
     })
    @photo_5 = Photograph.new({
      id: "5",      
      name: "Rue Mouffetard, Paris (Boy with Bottles)",      
      artist_id: "1",      
      year: "1962"      
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
      @curator.add_photograph(@photo_3)
      @curator.add_artist(@artist_1)
      @curator.add_artist(@artist_2)

      expect(@curator.collection).to be_a Hash
      expect(@curator.collection).to eq({@artist_1 => [@photo_1], @artist_2 => [@photo_2,@photo_3]})
    end
  end

  describe '#artists_with_multiple_photographs' do
    it 'returns list of artists with more than one photo' do
      @curator.add_photograph(@photo_1)
      @curator.add_photograph(@photo_2)
      @curator.add_photograph(@photo_3)
      @curator.add_artist(@artist_1)
      @curator.add_artist(@artist_2)

      expect(@curator.artists_with_multiple_photographs).to be_a Array
      expect(@curator.artists_with_multiple_photographs).to eq([@artist_2])
    end 
  end

  describe '#photos_by_country' do
    it 'returns list of photos that were taken by artist from given country' do
      @curator.add_photograph(@photo_1)
      @curator.add_photograph(@photo_2)
      @curator.add_photograph(@photo_3)
      @curator.add_artist(@artist_1)
      @curator.add_artist(@artist_2)

      expect(@curator.photos_by_country('United States')).to eq([@photo_2, @photo_3])
      expect(@curator.photos_by_country('France')).to eq([@photo_1])
      expect(@curator.photos_by_country('Spain')).to eq('No artist found.')
    end
  end

  describe '#add_photo_collection' do
    it 'adds photos from CSV file' do
      file = './data/photographs.csv'
      @curator.add_photo_collection(file)

      expect(@curator.photographs.empty?).to be false
      expect(@curator.photographs.sample).to be_a Photograph
      expect(@curator.photographs.sample.id).to_not be false
      expect(@curator.photographs.sample.name).to_not be false
      expect(@curator.photographs.sample.artist_id).to_not be false
      expect(@curator.photographs.sample.year).to_not be false
    end

    it 'does not overwrite existing photos' do
      @curator.add_photograph(@photo_3)

      expect(@curator.photographs).to eq([@photo_3])

      file = './data/photographs.csv'
      @curator.add_photo_collection(file)

      expect(@curator.photographs.include?(@photo_3)).to be true
    end
  end

  describe '#photos_from_time_period' do
    it 'returns list of photos from year within given range' do
      @curator.add_photograph(@photo_1)
      @curator.add_photograph(@photo_2)
      @curator.add_photograph(@photo_3)

      expect(@curator.photos_from_time_period('1940', '1960')).
      to eq([@photo_1, @photo_2])
    end
  end

  describe '#artist_at_age' do
    it 'returns age at time of given photo and photos taken at that age' do
      @curator.add_photograph(@photo_1)
      @curator.add_photograph(@photo_2)
      @curator.add_photograph(@photo_3)
      @curator.add_photograph(@photo_4)
      @curator.add_photograph(@photo_5)
      @curator.add_artist(@artist_1)

      expected_results = ({'46' => [@photo_1, @photo_4]})

      expect(@curator.artist_at_age(@photo_1)).to eq(expected_results)
    end
  end

  describe '#artist_age_when_photo_taken' do
    it 'returns artist age when photo was taken' do
      @curator.add_photograph(@photo_1)
      @curator.add_artist(@artist_1)

      expect(@curator.artist_age_when_photo_taken(@photo_1)).to eq '46'
    end
  end
end
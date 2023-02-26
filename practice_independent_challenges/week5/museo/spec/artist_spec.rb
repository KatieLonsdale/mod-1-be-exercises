require './spec_helper'

RSpec.describe Artist do
  before(:each) do
    attributes = {
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
    }
    @artist = Artist.new(attributes)
  end
  describe '#initialize' do
    it 'exists' do
      expect(@artist).to be_a Artist
    end
    it 'has an id' do
      expect(@artist.id).to eq('2')
    end
    it 'has a name' do
      expect(@artist.name).to eq('Ansel Adams')
    end
    it 'has a birth year' do
      expect(@artist.born).to eq('1902')
    end
    it 'has a death year' do
      expect(@artist.died).to eq ('1984')
    end
    it 'has a country' do
      expect(@artist.country).to eq('United States')
    end
  end

  describe '#age_at_death' do
    xit 'returns age at death' do
      expect(@artist.age_at_death).to eq 82
      expect(@artist.age_at_death).to be_a Integer
    end
  end
end
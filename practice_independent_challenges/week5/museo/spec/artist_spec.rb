require 'rspec'
require_relative '../lib/artist.rb'

RSpec.describe 'Artist' do
  it 'exists and has the correct attributes' do
    attributes = {
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
    }
    artist_1 = Artist.new(attributes)

    expect(artist_1).to be_a(Artist)
    expect(artist_1.id).to eq("2")
    expect(artist_1.name).to eq("Ansel Adams")
    expect(artist_1.born).to eq("1902")
    expect(artist_1.died).to eq("1984")
    expect(artist_1.country).to eq("United States")
  end

  describe 'instance methods' do
    describe '#age_at_death' do
      it 'can calculate age at death' do
        attributes = {
          id: "2",
          name: "Ansel Adams",
          born: "1902",
          died: "1984",
          country: "United States"
        }
        artist_1 = Artist.new(attributes)

        expect(artist_1.age_at_death).to eq(82)
      end
    end
  end
end
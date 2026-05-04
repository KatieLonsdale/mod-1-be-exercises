require 'rspec'
require_relative '../lib/curator.rb'
require_relative '../lib/photograph.rb'
require_relative '../lib/artist.rb'

RSpec.describe 'Curator' do
  it 'exists and has the correct attributes' do
    curator = Curator.new

    expect(curator).to be_a(Curator)
    expect(curator.photographs).to eq([])
    expect(curator.artists).to eq([])
  end

  describe 'instance methods' do
    describe '#add_photograph' do
      it 'can add photographs' do
        attributes = {
          id: "1",
          name: "Rue Mouffetard, Paris (Boy with Bottles)",
          artist_id: "4",
          year: "1954"
        }
        photograph = Photograph.new(attributes)

        attributes_2 = {
          id: "2",
          name: "Moonrise, Hernandez",
          artist_id: "2",
          year: "1941"
        }
        photograph_2 = Photograph.new(attributes_2)

        curator = Curator.new
        curator.add_photograph(photograph)
        curator.add_photograph(photograph_2)

        expect(curator.photographs).to eq([photograph, photograph_2])
      end
    end

    describe '#add_artist' do
      it 'can add artists' do
        artist_1 = Artist.new({
          id: "1",
          name: "Henri Cartier-Bresson",
          born: "1908",
          died: "2004",
          country: "France"
        })

        artist_2 = Artist.new({
          id: "2",
          name: "Ansel Adams",
          born: "1902",
          died: "1984",
          country: "United States"
        })

        curator = Curator.new
        curator.add_artist(artist_1)
        curator.add_artist(artist_2)

        expect(curator.artists).to eq([artist_1, artist_2])
      end
    end

    describe '#find_artist_by_id' do
      before(:each) do
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

        @curator = Curator.new
        @curator.add_artist(@artist_1)
        @curator.add_artist(@artist_2)
      end

      it 'can find an artist by id' do
        expect(@curator.find_artist_by_id("1")).to eq(@artist_1)
        expect(@curator.find_artist_by_id("2")).to eq(@artist_2)
      end

      it 'returns nil if no artist matches the id' do
        expect(@curator.find_artist_by_id("5")).to eq(nil)
      end
    end

    describe '#artists_with_photographs' do
      it 'returns artists and their photographs' do
        artist_1 = Artist.new({
          id: "1",
          name: "Henri Cartier-Bresson",
          born: "1908",
          died: "2004",
          country: "France"
        })

        artist_2 = Artist.new({
          id: "2",
          name: "Ansel Adams",
          born: "1902",
          died: "1984",
          country: "United States"
        })

        artist_3 = Artist.new({
          id: "3",
          name: "Diane Arbus",
          born: "1923",
          died: "1971",
          country: "United States"
        })

        photograph_1 = Photograph.new({
          id: "1",
          name: "Rue Mouffetard, Paris (Boy with Bottles)",
          artist_id: "1",
          year: "1954"
        })

        photograph_2 = Photograph.new({
          id: "2",
          name: "Moonrise, Hernandez",
          artist_id: "2",
          year: "1941"
        })

        photograph_3 = Photograph.new({
          id: "3",
          name: "Behind the Gare Saint-Lazare",
          artist_id: "1",
          year: "1932"
        })

        curator = Curator.new
        curator.add_artist(artist_1)
        curator.add_artist(artist_2)
        curator.add_artist(artist_3)
        curator.add_photograph(photograph_1)
        curator.add_photograph(photograph_2)
        curator.add_photograph(photograph_3)

        result = curator.artists_with_photographs

        expect(result).to be_a(Hash)
        expect(result[artist_1]).to eq([photograph_1, photograph_3])
        expect(result[artist_2]).to eq([photograph_2])
        expect(result[artist_3]).to eq([])
      end
    end

    describe '#prolific_artist_names' do
      it 'returns names of artists with more than one photograph' do
        artist_1 = Artist.new({
          id: "1",
          name: "Henri Cartier-Bresson",
          born: "1908",
          died: "2004",
          country: "France"
        })

        artist_2 = Artist.new({
          id: "2",
          name: "Ansel Adams",
          born: "1902",
          died: "1984",
          country: "United States"
        })

        artist_3 = Artist.new({
          id: "3",
          name: "Diane Arbus",
          born: "1923",
          died: "1971",
          country: "United States"
        })

        photograph_1 = Photograph.new({
          id: "1",
          name: "Rue Mouffetard, Paris (Boy with Bottles)",
          artist_id: "1",
          year: "1954"
        })

        photograph_2 = Photograph.new({
          id: "2",
          name: "Moonrise, Hernandez",
          artist_id: "2",
          year: "1941"
        })

        photograph_3 = Photograph.new({
          id: "3",
          name: "Behind the Gare Saint-Lazare",
          artist_id: "1",
          year: "1932"
        })

        photograph_4 = Photograph.new({
          id: "4",
          name: "Child with Toy Hand Grenade",
          artist_id: "3",
          year: "1962"
        })

        photograph_5 = Photograph.new({
          id: "5",
          name: "Identical Twins",
          artist_id: "3",
          year: "1967"
        })

        curator = Curator.new
        curator.add_artist(artist_1)
        curator.add_artist(artist_2)
        curator.add_artist(artist_3)
        curator.add_photograph(photograph_1)
        curator.add_photograph(photograph_2)
        curator.add_photograph(photograph_3)
        curator.add_photograph(photograph_4)
        curator.add_photograph(photograph_5)

        result = curator.prolific_artist_names

        expect(result).to be_a(Array)
        expect(result).to eq(["Henri Cartier-Bresson", "Diane Arbus"])
      end
    end

    describe '#photographs_from_country' do
      it 'returns photographs from artists from a given country' do
        artist_1 = Artist.new({
          id: "1",
          name: "Henri Cartier-Bresson",
          born: "1908",
          died: "2004",
          country: "France"
        })

        artist_2 = Artist.new({
          id: "2",
          name: "Ansel Adams",
          born: "1902",
          died: "1984",
          country: "United States"
        })

        artist_3 = Artist.new({
          id: "3",
          name: "Diane Arbus",
          born: "1923",
          died: "1971",
          country: "United States"
        })

        photograph_1 = Photograph.new({
          id: "1",
          name: "Rue Mouffetard, Paris (Boy with Bottles)",
          artist_id: "1",
          year: "1954"
        })

        photograph_2 = Photograph.new({
          id: "2",
          name: "Moonrise, Hernandez",
          artist_id: "2",
          year: "1941"
        })

        photograph_3 = Photograph.new({
          id: "3",
          name: "Behind the Gare Saint-Lazare",
          artist_id: "1",
          year: "1932"
        })

        photograph_4 = Photograph.new({
          id: "4",
          name: "Child with Toy Hand Grenade",
          artist_id: "3",
          year: "1962"
        })

        photograph_5 = Photograph.new({
          id: "5",
          name: "Identical Twins",
          artist_id: "3",
          year: "1967"
        })

        curator = Curator.new
        curator.add_artist(artist_1)
        curator.add_artist(artist_2)
        curator.add_artist(artist_3)
        curator.add_photograph(photograph_1)
        curator.add_photograph(photograph_2)
        curator.add_photograph(photograph_3)
        curator.add_photograph(photograph_4)
        curator.add_photograph(photograph_5)

        result = curator.photographs_from_country("United States")

        expect(result).to be_a(Array)
        expect(result).to eq([photograph_2, photograph_4, photograph_5])
        expect(curator.photographs_from_country("Spain")).to eq([])
      end
    end

    
  end
end


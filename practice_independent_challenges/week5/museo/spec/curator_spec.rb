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
  end
end



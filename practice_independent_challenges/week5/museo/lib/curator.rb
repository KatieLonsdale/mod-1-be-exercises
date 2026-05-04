require 'csv'
require_relative 'photograph'

class Curator
  attr_reader :photographs, :artists

  def initialize
    @photographs = []
    @artists = []
  end

  def add_photograph(photograph)
    @photographs << photograph
  end

  def add_photographs_from_csv(file_path)
    File.open(file_path) do |file|
      CSV.new(file, headers: true).each do |row|
        add_photograph(Photograph.new({
          id: row["id"],
          name: row["name"],
          artist_id: row["artist_id"],
          year: row["year"]
        }))
      end
    end
  end

  def add_artist(artist)
    @artists << artist
  end

  def find_artist_by_id(id)
    @artists.find { |artist| artist.id == id }
  end

  def artists_with_photographs
    @artists.each_with_object({}) do |artist, hash|
      hash[artist] = @photographs.select { |photo| photo.artist_id == artist.id }
    end
  end

  def prolific_artist_names
    artists_with_photographs.select { |artist, photos| photos.length > 1 }.map { |artist, photos| artist.name }
  end

  def photographs_from_country(country)
    if country.class != String
      raise ArgumentError, "photographs_from_country requires a String as an argument. argument type given: #{country.class}"
    end

    artists_with_photographs.select { |artist, photos| artist.country == country }.values.flatten
  end
end


class Curator
  attr_reader :photographs, :artists

  def initialize
    @photographs = []
    @artists = []
  end

  def add_photograph(photograph)
    @photographs << photograph
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
    artists_with_photographs.select { |artist, photos| artist.country == country }.values.flatten
  end
end




class Curator
  attr_reader :photographs, :artists

  def initialize
    @photographs = []
    @artists = []
  end

  def add_photograph(photo)
    @photographs << photo
  end

  def add_artist(artist)
    @artists << artist
  end

  def find_artist_by_id(id)
    @artists.find{|artist| artist.id == id}
  end

  def collection
    collection = @photographs.group_by{|photo| photo.artist_id}
    collection.transform_keys{|id| find_artist_by_id(id)}
  end

  def artists_with_multiple_photographs
    collection.select{|artist, photos| artist if photos.count > 1}.keys
  end

  def photos_by_country(country)
    photos_array = collection.select do |artist, photos| 
      photos if artist.country == country
    end
    photos_array.empty? ? 'No artist found.' : photos_array.values.flatten
  end
end
require 'csv'

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

  def add_photo_collection(file)
    photos = CSV.open file, headers: true, header_converters: :symbol
    photos.each do |photo|
      @photographs << Photograph.new({id: photo[:id], 
                      name: photo[:name], 
                      artist_id: photo[:artist_id], 
                      year: photo[:year]})
    end
  end

  def photos_from_time_period(start, finish)
    @photographs.find_all do |photo|
      photo.year > start && photo.year < finish
    end
  end

  def artist_at_age(photo)
    age = artist_age_when_photo_taken(photo)
    photos = @photographs.find_all{|pic| pic.artist_id == photo.artist_id}
    {age => photos.find_all{|pic| pic.year == photo.year}}
  end

  def artist_age_when_photo_taken(photo)
    artist = find_artist_by_id(photo.id)
      (photo.year.to_i - artist.born.to_i).to_s
  end
end
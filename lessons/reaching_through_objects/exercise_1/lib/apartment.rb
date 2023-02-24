class Apartment
  attr_reader :rooms
  
  def initialize
    @rent_status = false
    @rooms = []
  end

  def is_rented?
    @rent_status
  end

  def rent
    @rent_status = true
  end

  def add_room(room)
    if @rooms.length < 4
      @rooms << room
    else
      'No more space.'
    end
  end

  def list_rooms_by_name_alphabetically
    sorted_rooms = @rooms.sort_by {|room| room.name}
    sorted_rooms.map{|room| room.name}
  end
end
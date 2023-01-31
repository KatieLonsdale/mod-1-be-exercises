class Venue
  attr_reader :name, :capacity, :patrons

  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @patrons = []
  end

  def add_patron(name)
    @patrons.push(name)
  end

  def yell_at_patrons
    @patrons.each do |patron|
      patron.upcase!
    end
    # how can this be done without mutating original array?
  end
end

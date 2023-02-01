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
    # upcase_patrons = []
    @patrons.map do |patron|
      # upcase_patrons.push(patron.upcase)
      patron.upcase
    end
    # upcase_patrons
  end
end

class Appointments
  def initialize
    @schedule = []
  end

  def at(time)
    @schedule << time
  end

  def earliest
    @schedule.sort.first
  end
end
class Appointments
  def initialize
    @schedule = []
  end

  def at(time)
    @schedule << time
  end

  def earliest
    sorted_schedule = @schedule.sort
    sorted_schedule.first
  end
end
class Apple
  def initialize
    @weeks_old = 0
  end

  def wait_a_week
    @weeks_old += 1
  end

  def ripe?
    @weeks_old >= 3
  end
end
class Shape

  def initialize(color, width, length)
    @color = color
    @length = length
    @width
  end

  def area
    @width * @length
  end

  def perimeter
    2 * (@length + @width)
  end
end
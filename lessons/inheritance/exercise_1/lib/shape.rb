class Shape

  attr_reader :color,
              :length,
              :width

  def initialize(color, length, width)
    @color = color
    @length = length
    @width = width
  end

  def area
    @width * @length
  end

  def perimeter
    2 * (@length + @width)
  end

  def black_and_white?
    greyscale = ['black', 'white']
    greyscale.include?(@color)
  end
end
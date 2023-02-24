require './lib/shape'

class Rectangle < Shape

  attr_reader :color,
              :length,
              :width

  def initialize(color, length, width)
    @color = color
    @length = length
    @width = width
  end
end
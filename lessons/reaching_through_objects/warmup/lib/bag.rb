class Bag
  attr_reader :candies

  def initialize
    @candies = []
  end

  def empty?
    @candies.empty?
  end

  def count
    @candies.count
  end

  def add_candy(candy)
    @candies << candy
  end

  def contains?(candy)
    @candies.any? do |item|
      item.type == candy
    end
  end
end
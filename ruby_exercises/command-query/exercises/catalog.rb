class Catalog
  def initialize
    @products = []
  end

  def <<(product)
    @products << product
  end

  def cheapest
    if @products.count > 0
      @products.sort_by {|product| product.price}.first.name
    end
  end
end
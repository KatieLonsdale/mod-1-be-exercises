require "./lib/rectangle"

#Unskip the tests one-by-one, then edit the Rectangle class so that each test passes.
RSpec.describe Rectangle do
  it "exists" do
    r = Rectangle.new("blue", 5, 10)
    expect(r.is_a? Shape).to be true
    expect(r.is_a? Rectangle).to be true
  end

  it "has color, length, and width attributes" do
    r = Rectangle.new("blue", 5, 10)
    expect(r.color).to eq("blue")
    expect(r.length).to eq(5)
    expect(r.width).to eq(10)
  end

  it "can calculate area" do
    r = Rectangle.new("blue", 5, 10)
    expect(r.area).to eq(50)
  end

  it "can calculate perimeter" do
    r = Rectangle.new("blue", 5, 10)
    expect(r.perimeter).to eq(30)
  end

  it 'tells us if it is black and white or not' do
    r = Rectangle.new("red", 2, 4)
    expect(r.black_and_white?).to be false

    r2 = Rectangle.new("white", 2, 4)
    expect(r2.black_and_white?).to be true
  end
end
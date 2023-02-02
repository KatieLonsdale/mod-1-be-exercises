class CardGenerator
  attr_reader :filename, :cards

  def initialize(filename)
    @filename = filename
    @cards = []

    file = File.open(@filename)
    File.foreach(@filename) do |line|
      array = line.chomp.split(',')
      question = array[0]
      answer = array[1]
      category = array[2]
      @cards.push(Card.new(question, answer, category))
    end
    file.close
  end
  


end
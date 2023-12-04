class Card
  attr_reader :id

  def initialize(input)
    @input = input
    @id = input.match(/Card (\d+)/)[1]
  end
end

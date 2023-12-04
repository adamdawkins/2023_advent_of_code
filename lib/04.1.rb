class Card
  attr_reader :id, :input

  def initialize(input)
    @input = input
    @id = input.match(/Card (\d+)/)[1]
  end

  def prize_numbers
    input.split(":").last.split(" | ").first.scan(/(\d+)/).flatten.map(&:to_i)
  end
end

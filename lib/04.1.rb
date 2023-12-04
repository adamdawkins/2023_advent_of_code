class Card
  attr_reader :id, :input

  def initialize(input)
    @input = input
    @id = input.match(/Card (\d+)/)[1]
    @prize_input, @number_input = input.split(":").last.split(" | ")
  end

  def prize_numbers
    prize_input.scan(/(\d+)/).flatten.map(&:to_i)
  end

  def numbers
    number_input.scan(/(\d+)/).flatten.map(&:to_i)
  end

  private

  attr_reader :prize_input, :number_input
end

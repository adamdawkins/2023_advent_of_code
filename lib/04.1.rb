class Card
  attr_reader :id, :input

  def initialize(input)
    @input = input
    @id = input.match(/Card (\d+)/)[1]
    @prize_input, @number_input = input.split(":").last.split(" | ")
  end

  def prize_numbers
    extract_numbers(prize_input)
  end

  def numbers
    extract_numbers(number_input)
  end

  def winning_numbers
    prize_numbers & numbers
  end

  private

  attr_reader :prize_input, :number_input

  def extract_numbers(string)
    string.scan(/(\d+)/).flatten.map(&:to_i)
  end
end

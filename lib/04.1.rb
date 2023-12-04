class Card
  attr_reader :id, :input

  def initialize(input)
    @input = input
    @id = input.match(/Card\s*(\d+)/)[1]
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

  def points
    return 0 if winning_numbers.empty?

    Array.new(winning_numbers.count - 1).inject(1) {|result, _n| result * 2}
  end

  private

  attr_reader :prize_input, :number_input

  def extract_numbers(string)
    string.scan(/(\d+)/).flatten.map(&:to_i)
  end
end

class Pile
  attr_reader :cards
  def initialize(input)
    @cards = input.map { |card_input| Card.new(card_input) }
  end

  def total_points
    cards.sum(&:points)
  end
end

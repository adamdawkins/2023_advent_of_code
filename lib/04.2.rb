class Card
  attr_reader :id, :input

  def initialize(input)
    @input = input
    @id = input.match(/Card\s*(\d+)/)[1].to_i
    @prize_input, @number_input = input.split(":").last.split(" | ")
  end

  def prize_numbers
    extract_numbers(prize_input)
  end

  def numbers
    extract_numbers(number_input)
  end

  def winning_number_count
    (prize_numbers & numbers).count
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

  def total_cards
  end
end

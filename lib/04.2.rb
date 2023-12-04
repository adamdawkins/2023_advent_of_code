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
  attr_reader :cards, :card_counts

  def initialize(input)
    @cards = input.map { |card_input| Card.new(card_input) }

    # Start with a count of 1 for each card
    @card_counts = Hash[(1..input.length).zip(Array.new(input.length) { 1 })]
  end

  def process_cards
    cards.each do |card|
      process_card(card, card_counts[card.id])
    end
  end

  def process_card(card, copies)
    next_card_id = card.id + 1
    (next_card_id..(card.winning_number_count + next_card_id -1)).each do |id|
      @card_counts[id] += copies
    end
  end

  def total_cards
    @card_counts.values.sum
  end
end

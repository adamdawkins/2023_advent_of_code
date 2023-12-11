require "ostruct"

class Hand
  attr_reader :cards

  FIVE_OF_A_KIND  = :five_of_a_kind
  FOUR_OF_A_KIND  = :four_of_a_kind
  FULL_HOUSE      = :full_house
  THREE_OF_A_KIND = :three_of_a_kind
  TWO_PAIR        = :two_pair
  ONE_PAIR        = :one_pair
  HIGH_CARD       = :high_card

  TYPE_RANKS = { FIVE_OF_A_KIND  => 6,
                 FOUR_OF_A_KIND  => 5,
                 FULL_HOUSE      => 4,
                 THREE_OF_A_KIND => 3,
                 TWO_PAIR        => 2,
                 ONE_PAIR        => 1,
                 HIGH_CARD       => 0 }

  CARD_RANKS = { "A" => 12,
                 "K" => 11,
                 "Q" => 10,
                 "T" =>  8,
                 "9" =>  7,
                 "8" =>  6,
                 "7" =>  5,
                 "6" =>  4,
                 "5" =>  3,
                 "4" =>  2,
                 "3" =>  1,
                 "2" =>  0,
                 "J" =>  -1}


  def initialize(cards)
    @cards = cards.chars
  end

  def type
    case max_card_count
    when 5
      FIVE_OF_A_KIND
    when 4
      FOUR_OF_A_KIND
    when 3
      counts.values.include?(2) ? FULL_HOUSE : THREE_OF_A_KIND
    when 2
      counts.values.count(2) == 2 ? TWO_PAIR : ONE_PAIR
    else
      HIGH_CARD
    end
  end

  def rank
    TYPE_RANKS[type]
  end

  def joker_count
    cards.count("J")
  end

  def counts_without_jokers
    cards.reject {|c| c == "J"}.tally
  end

  def <=>(other_hand)
    type_comparison = rank <=> other_hand.rank
    return card_comparison(other_hand) if type_comparison.zero?
    type_comparison
  end

  def to_s
    cards.join
  end

  private

  def counts
    cards.tally
  end

  def max_card_count
    (counts_without_jokers.values.max || 0) + joker_count
  end

  def card_comparison(other_hand)
    (0..4).each do |position|
      comparison = CARD_RANKS[cards[position]] <=> CARD_RANKS[other_hand.cards[position]]
      return comparison unless comparison.zero?
    end
    0
  end
end

class CamelCards
  def initialize(input)
    @input = input
  end

  def table
    @table ||= input.map do |play|
      hand_input, bid_input = play.split(" ")
      OpenStruct.new(hand: Hand.new(hand_input), bid: bid_input.to_i)
    end
  end

  def order
    table.sort_by(&:hand)
  end

  def total_winnings
    winnings = 0
    order.map(&:bid).each_with_index do |bid, index|
      winnings += bid * (index + 1)
    end
    
    winnings
  end

  private

  attr_reader :input
end

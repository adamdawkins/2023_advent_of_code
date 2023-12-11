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

  TYPE_RANKS = { FIVE_OF_A_KIND  => 0,
                 FOUR_OF_A_KIND  => 1,
                 FULL_HOUSE      => 2,
                 THREE_OF_A_KIND => 3,
                 TWO_PAIR        => 4,
                 ONE_PAIR        => 5,
                 HIGH_CARD       => 6 }

  CARD_RANKS = { "A" =>  0,
                 "K" =>  1,
                 "Q" =>  2,
                 "J" =>  3,
                 "T" =>  4,
                 "9" =>  5,
                 "8" =>  6,
                 "7" =>  7,
                 "6" =>  8,
                 "5" =>  9,
                 "4" => 10,
                 "3" => 11,
                 "2" => 12 }


  def initialize(cards)
    @cards = cards.chars
  end

  def type
    case counts.values.max
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

  def <=>(other_hand)
    type_comparison = rank <=> other_hand.rank
    return card_comparison(other_hand) if type_comparison.zero?
    type_comparison
  end

  private

  def counts
    cards.tally
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
    input.map do |play|
      hand_input, bid_input = play.split(" ")
      OpenStruct.new(hand: Hand.new(hand_input), bid: bid_input.to_i)
    end
  end

  private

  attr_reader :input
end

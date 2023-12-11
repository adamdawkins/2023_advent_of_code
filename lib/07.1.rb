class Hand
  attr_reader :cards

  FIVE_OF_A_KIND  = :five_of_a_kind
  FOUR_OF_A_KIND  = :four_of_a_kind
  FULL_HOUSE      = :full_house
  THREE_OF_A_KIND = :three_of_a_kind
  TWO_PAIR        = :two_pair
  ONE_PAIR        = :one_pair
  HIGH_CARD       = :high_card

  TYPE_RANKS = { FIVE_OF_A_KIND  => 7,
                 FOUR_OF_A_KIND  => 6,
                 FULL_HOUSE      => 5,
                 THREE_OF_A_KIND => 4,
                 TWO_PAIR        => 3,
                 ONE_PAIR        => 2,
                 HIGH_CARD       => 1 }

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

  private

  def counts
    cards.tally
  end

end

require "minitest/autorun"
require_relative "../lib/04.2"

class CardTest < Minitest::Test
# Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
# Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19
# Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1
# Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83
# Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36
# Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11
  def setup
    input = "Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53"
    @card = Card.new(input)
  end

  def test_id
    assert_equal(1, @card.id)
  end

  def test_prize_numbers
    assert_equal([41, 48, 83, 86, 17], @card.prize_numbers)
  end

  def test_numbers
    assert_equal([83, 86, 6, 31, 17, 9, 48, 53], @card.numbers)
  end

  def test_winning_number_count
    assert_equal(4, @card.winning_number_count)
  end
end

class PileTest < Minitest::Test
  def setup
    input = ["Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53",
             "Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19",
             "Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1",
             "Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83",
             "Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36",
             "Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11"]
    @pile = Pile.new(input)
  end

  def test_card_counts
    assert_equal({1=> 1, 2=> 1, 3=> 1, 4=> 1, 5=> 1, 6=> 1}, @pile.card_counts)
  end

  def test_process_card
    @pile.process_card(Card.new("Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53"), 1)
    assert_equal({1 => 1,
                  2 => 2,
                  3 => 2,
                  4 => 2,
                  5 => 2,
                  6 => 1}, @pile.card_counts)

  end

  def test_total_cards
    assert_equal(6, @pile.total_cards)
  end
end

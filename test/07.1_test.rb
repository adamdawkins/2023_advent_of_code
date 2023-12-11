require "minitest/autorun"
require_relative "../lib/07.1"

class HandTest < Minitest::Test
  def test_type
    assert_equal(Hand::FIVE_OF_A_KIND, Hand.new("AAAAA").type)
    assert_equal(Hand::FOUR_OF_A_KIND, Hand.new("AA8AA").type)
    assert_equal(Hand::FULL_HOUSE, Hand.new("23332").type)
    assert_equal(Hand::THREE_OF_A_KIND, Hand.new("TTT98").type)
    assert_equal(Hand::TWO_PAIR, Hand.new("23432").type)
    assert_equal(Hand::ONE_PAIR, Hand.new("A23A4").type)
    assert_equal(Hand::HIGH_CARD, Hand.new("23456").type)
  end

  def test_rank
    assert_equal(0, Hand.new("AAAAA").rank)
    assert_equal(1, Hand.new("AA8AA").rank)
    assert_equal(2, Hand.new("23332").rank)
    assert_equal(3, Hand.new("TTT98").rank)
    assert_equal(4, Hand.new("23432").rank)
    assert_equal(5, Hand.new("A23A4").rank)
    assert_equal(6, Hand.new("23456").rank)
  end

  def test_spaceship
    assert_equal(-1, Hand.new("AAAAA")<=>(Hand.new("AA8AA")))
  end
end

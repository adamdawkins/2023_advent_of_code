require "minitest/autorun"
require_relative "../lib/03.1"

class NumberTest < Minitest::Test
  def test_coordinates
    number = Number.new(value: 35, y: 2, xs: [2, 3])
    assert_equal([[2,2], [2,3]], number.coordinates)
  end

  def test_adjacent_coordinates
    # ** = number
    # x  = adjacent coordinate
    # 0 0123456789A
    # 1 0xxxx56789A
    # 2 0x**x56789A
    # 3 0xxxx56789A

    number = Number.new(value: 35, y: 2, xs: [2, 3])
    assert_equal([[1,1], [1,2], [1,3], [1,4],
                  [2,1], [2,4],
                  [3,1], [3,2], [3,3], [3,4]], number.adjacent_coordinates)

  end
end

class EngineSchematicTest < Minitest::Test
  def setup
    @input = ["467..114..",
              "...*......",
              "..35..633.",
              "......#...",
              "617*......",
              ".....+.58.",
              "..592.....",
              "......755.",
              "...$.*....",
              ".664.598.."]
  end

  def test_numbers
    input = ["467..114..",
             "...*......",
             "..35..633."]
    numbers = EngineSchematic.new(input).numbers
    assert_equal([467, 114, 35, 633], numbers.map(&:value))
    assert_equal([0, 0, 2, 2]       , numbers.map(&:y))
    assert_equal([0, 5, 2, 6]       , numbers.map(&:min_x))
    assert_equal([2, 7, 3, 8]       , numbers.map(&:max_x))
  end

  def test_symbol_at?
    es = EngineSchematic.new(@input)
    refute es.symbol_at?([0,0]) # refute digits
    refute es.symbol_at?([0,4]) # refute .
    assert es.symbol_at?([1,3]) # assert *
    assert es.symbol_at?([3,6]) # assert #
    assert es.symbol_at?([4,3]) # assert *
    assert es.symbol_at?([5,5]) # assert +
    assert es.symbol_at?([8,3]) # assert $
    assert es.symbol_at?([8,5]) # assert *
  end

  # def test_sum
  #   assert_equal(4361, EngineSchematic.new(@input).sum)
  # end
end

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

  def test_sum
    assert_equal(4361, EngineSchematic.new(@input).sum)
  end
end

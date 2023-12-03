require "minitest/autorun"
require_relative "../lib/03.1"

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

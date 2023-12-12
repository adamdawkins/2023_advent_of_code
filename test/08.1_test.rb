require "minitest/autorun"
require_relative "../lib/08.1"

class WastelandTest < Minitest::Test
  def setup
    @input = [
      "RL",
      "",
      "AAA = (BBB, CCC)",
      "BBB = (DDD, EEE)",
      "CCC = (ZZZ, GGG)",
      "DDD = (DDD, DDD)",
      "EEE = (EEE, EEE)",
      "GGG = (GGG, GGG)",
      "ZZZ = (ZZZ, ZZZ)"
    ]
  end

  def test_directions
    wasteland = Wasteland.new(@input)
    assert_equal([:right, :left], wasteland.directions)
  end

  def test_network
    wasteland = Wasteland.new(@input)
    assert_equal({ "AAA" => ["BBB", "CCC"],
                   "BBB" => ["DDD", "EEE"],
                   "CCC" => ["ZZZ", "GGG"],
                   "DDD" => ["DDD", "DDD"],
                   "EEE" => ["EEE", "EEE"],
                   "GGG" => ["GGG", "GGG"],
                   "ZZZ" => ["ZZZ", "ZZZ"]}, wasteland.network
                )
  end
end

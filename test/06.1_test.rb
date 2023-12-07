require "minitest/autorun"
require_relative "../lib/06.1"

class RacerTest < Minitest::Test
  def setup
    @input = ["Time:      7  15   30",
               "Distance:  9  40  200"]
    @racer = Racer.new(@input)
  end

  def test_races
    assert_equal([[7, 9], [15, 40], [30, 200]], @racer.races)
  end
end

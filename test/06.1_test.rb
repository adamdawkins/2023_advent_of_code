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

class RaceTest < Minitest::Test
  def test_hold
    race = Race.new(time: 7)
    assert_equal( 0, race.hold(0))
    assert_equal( 6, race.hold(1))
    assert_equal(10, race.hold(2))
    assert_equal(12, race.hold(3))
    assert_equal(12, race.hold(4))
    assert_equal(10, race.hold(5))
    assert_equal( 6, race.hold(6))
    assert_equal( 0, race.hold(7))
  end
end

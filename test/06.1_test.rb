require "minitest/autorun"
require_relative "../lib/06.1"

class RacerTest < Minitest::Test
  def setup
    @input = ["Time:      7  15   30",
               "Distance:  9  40  200"]
    @racer = Racer.new(@input)
  end

  def test_races
    assert_equal([[7, 9], [15, 40], [30, 200]], @racer.races.map {|race| [race.time, race.record] })
  end

  def test_number_of_wins_per_race
    assert_equal([4, 8, 9], @racer.number_of_wins_per_race)
  end
end

class RaceTest < Minitest::Test
  def setup
    @race = Race.new(time: 7, record: 9)
  end
  def test_hold
    assert_equal( 0, @race.hold(0))
    assert_equal( 6, @race.hold(1))
    assert_equal(10, @race.hold(2))
    assert_equal(12, @race.hold(3))
    assert_equal(12, @race.hold(4))
    assert_equal(10, @race.hold(5))
    assert_equal( 6, @race.hold(6))
    assert_equal( 0, @race.hold(7))
  end

  def test_distances
    assert_equal([0, 6, 10, 12, 12, 10, 6, 0], @race.distances)
  end

  def test_number_of_wins
    assert_equal(4, @race.number_of_wins)
  end
end

require "minitest/autorun"
require_relative "../lib/05.2"

class MapTest < Minitest::Test
  def setup
    @input = ["seed-to-soil map:",
              "50 98 2",
              "52 50 48"]
    @map = Map.new(@input)
  end

  def test_name
    assert_equal("seed-to-soil", @map.name)
  end

  def test_transform
    assert_equal(81, @map.transform(79))
    assert_equal(14, @map.transform(14))
    assert_equal(57, @map.transform(55))
    assert_equal(13, @map.transform(13))
  end
end

class AlmanacTest < Minitest::Test
  def setup 
    @input = [
      "seeds: 79 14 55 13",
      "",
      "seed-to-soil map:",
      "50 98 2",
      "52 50 48",
      "",
      "soil-to-fertilizer map:",
      "0 15 37",
      "37 52 2",
      "39 0 15",
      "",
      "fertilizer-to-water map:",
      "49 53 8",
      "0 11 42",
      "42 0 7",
      "57 7 4",
      "",
      "water-to-light map:",
      "88 18 7",
      "18 25 70",
      "",
      "light-to-temperature map:",
      "45 77 23",
      "81 45 19",
      "68 64 13",
      "",
      "temperature-to-humidity map:",
      "0 69 1",
      "1 0 69",
      "",
      "humidity-to-location map:",
      "60 56 37",
      "56 93 4"]
    @almanac = Almanac.new(@input)
  end

  def test_seeds
    # This line describes two ranges of seed numbers to be planted in the garden.
    # The first range starts with seed number 79 and contains 14 values:
    # 79, 80, ..., 91, 92.
    # The second range starts with seed number 55 and contains 13 values:
    # 55, 56, ..., 66, 67.
    assert_equal((79..92).to_a + (55..67).to_a, @almanac.seeds) 
  end

  def test_maps
    assert_equal(%w[seed-to-soil
                    soil-to-fertilizer
                    fertilizer-to-water
                    water-to-light
                    light-to-temperature
                    temperature-to-humidity
                    humidity-to-location], @almanac.maps.map(&:name))
  end

  def test_min_seed_location
    assert_equal(46, @almanac.min_seed_location)
  end

end

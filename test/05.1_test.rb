require "minitest/autorun"
require_relative "../lib/05.1"

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
    # seeds: 79 14 55 13
    assert_equal([79, 14, 55, 13], @almanac.seeds) 
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

  def test_seed_locations
    # Seed 79, soil 81, fertilizer 81, water 81, light 74, temperature 78, humidity 78, location 82.
    # Seed 14, soil 14, fertilizer 53, water 49, light 42, temperature 42, humidity 43, location 43.
    # Seed 55, soil 57, fertilizer 57, water 53, light 46, temperature 82, humidity 82, location 86.
    # Seed 13, soil 13, fertilizer 52, water 41, light 34, temperature 34, humidity 35, location 35.

    assert_equal([82, 43, 86, 35], @almanac.seed_locations)
  end

  def test_min_seed_location
    assert_equal(35, @almanac.min_seed_location)
  end

end

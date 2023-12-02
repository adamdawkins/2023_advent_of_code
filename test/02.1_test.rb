require "minitest/autorun"
require_relative "../lib/02.1"

class GameTest < Minitest::Test
  def test_id
    game = Game.new("Game 1000: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green")
    assert_equal(1000, game.id)
  end

  def test_max_colours
    game = Game.new("Game 1000: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green")
    assert_equal(4, game.max_red)
    assert_equal(2, game.max_green)
    assert_equal(6, game.max_blue)
  end
end

class DrawTest < Minitest::Test
  def test_colours
    draw = Draw.new("1 red, 2 green, 6 blue")
    assert_equal(1, draw.red)
    assert_equal(2, draw.green)
    assert_equal(6, draw.blue)
  end

  def test_data
    assert_equal({ red: 4, green: 0, blue: 3 }, Draw.new("3 blue, 4 red").send(:data))
    assert_equal({ red: 1, green: 2, blue: 6 }, Draw.new("1 red, 2 green, 6 blue").send(:data))
    assert_equal({ red: 0, green: 2, blue: 0 }, Draw.new("2 green").send(:data))
  end
end

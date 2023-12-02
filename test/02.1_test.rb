require "minitest/autorun"
require_relative "../lib/02.1"

class CubeConundrumTest < Minitest::Test

  def test_game_id
    game = Game.new("Game 1000: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green")
    assert_equal(1000, game.id)
  end

  def test_draw_data
    assert_equal({ red: 4, green: 0, blue: 3 }, Draw.new("3 blue, 4 red").data)
    assert_equal({ red: 1, green: 2, blue: 6 }, Draw.new("1 red, 2 green, 6 blue").data)
    assert_equal({ red: 0, green: 2, blue: 0 }, Draw.new("2 green").data)
  end

  def test_draw_colours
    draw = Draw.new("1 red, 2 green, 6 blue")
    assert_equal(1, draw.red)
    assert_equal(2, draw.green)
    assert_equal(6, draw.blue)
  end
end

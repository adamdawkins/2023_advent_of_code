require "minitest/autorun"
require_relative "../lib/02.2"

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

  def test_max_power
    assert_equal(  48, Game.new("Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green").max_power)
    assert_equal(  12, Game.new("Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue").max_power)
    assert_equal(1560, Game.new("Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red").max_power)
    assert_equal( 630, Game.new("Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red").max_power)
    assert_equal(  36, Game.new("Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green").max_power)
  end
end

class DrawTest < Minitest::Test
  def test_colours
    draw = Draw.new("1 red, 2 green, 6 blue")
    assert_equal(1, draw.red)
    assert_equal(2, draw.green)
    assert_equal(6, draw.blue)
  end
end

class CubeConundrumTest < Minitest::Test
  def test_possible_by_max_color_games
    input = ["Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green",
             "Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue",
             "Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red",
             "Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red",
             "Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green"].join("\n")
    cube_conundrum = CubeConundrum.new(max: { red: 12, green: 13, blue: 14 }, input:)
    assert_equal([1, 2, 5], cube_conundrum.possible_by_max_color_games.map(&:id))
  end

  def test_answer
    input = ["Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green",
             "Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue",
             "Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red",
             "Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red",
             "Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green"].join("\n")
    cube_conundrum = CubeConundrum.new(max: { red: 12, green: 13, blue: 14 }, input:)
    assert_equal(8, cube_conundrum.answer)

  end
end

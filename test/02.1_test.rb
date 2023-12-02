require "minitest/autorun"
require_relative "../lib/02.1"

class CubeConundrumTest < Minitest::Test

  def test_game_id
    game = Game.new("Game 1000: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green")
    assert_equal(1000, game.id)
  end
end

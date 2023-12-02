class Game
  attr_reader :id, :input

  def initialize(input)
    @input = input
    @id = input.match(/Game (\d*)/)[1].to_i
  end

  def draws
    draw_inputs.map {|draw_input| Draw.new(draw_input) }
  end

  def max_red
    draws.max_by(&:red).red
  end

  def max_green
    draws.max_by(&:green).green
  end

  def max_blue
    draws.max_by(&:blue).blue
  end

  def max_power
    [max_red, max_green, max_blue].reduce(:*)
  end

  private

  def draw_inputs
   input.match(/Game \d+: (.*)/)[1].split(";").map(&:strip)
  end
end

class Draw
  attr_reader :input

  def initialize(input)
    @input = input
  end

  def red 
    data[:red]
  end

  def green 
    data[:green]
  end

  def blue 
    data[:blue]
  end

  private 

  def data
    result = { red: 0, green: 0, blue: 0 }
    input.scan(/((\d+) (\w+))/).map {|a| a.drop(1) }.each do |number, colour|
      result[colour.to_sym] = number.to_i
    end

    result
  end
end

class CubeConundrum
  attr_reader :max, :input
  def initialize(max:, input:)
    @max = max
    @input = input
  end

  def possible_by_max_color_games
    games.filter do |game|
      [game.max_red <= max[:red],
       game.max_green <= max[:green],
       game.max_blue <= max[:blue]].all?
    end
  end

  def answer
    possible_by_max_color_games.sum(&:id)
  end

  def games 
    @games ||= input.split("\n").map { |game_input| Game.new(game_input) }
  end
end

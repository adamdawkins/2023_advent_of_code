class Game
  attr_reader :id, :input

  def initialize(input)
    @input = input
    @id = input.match(/Game (\d*)/)[1].to_i
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


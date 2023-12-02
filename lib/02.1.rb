class Game
  attr_reader :id

  def initialize(input_string)
    @id = input_string.match(/Game (\d*)/)[1].to_i
  end
end

class Wasteland
  def initialize(input)
    @input = input
    @directions_input = @input.first
  end

  def directions
    directions_input.chars.map {|c| c == "R" ? :right : :left }
  end

  private

  attr_reader :input, :directions_input
end

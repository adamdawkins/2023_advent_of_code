class Wasteland
  def initialize(input)
    @input = input
    @directions_input = @input.first
    @network_input = @input[2..]
  end

  def directions
    directions_input.chars.map {|c| c == "R" ? :right : :left }
  end

  def network
    network_input.map {|node| parse_node(node)}.to_h
  end


  private

  attr_reader :input, :directions_input, :network_input

  def parse_node(node)
    key, left, right = node.scan(/(\w*) = \((\w*), (\w*)\)/).flatten
    [key, [left, right]]
  end
end

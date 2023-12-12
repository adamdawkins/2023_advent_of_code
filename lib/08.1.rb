class Wasteland
  attr_reader :steps
  def initialize(input)
    @input = input
    @directions_input = @input.first
    @network_input = @input[2..]
    @steps = 0
  end

  def directions
    directions_input.chars.map {|c| c == "R" ? :right : :left }
  end

  def network
    network_input.map {|node| parse_node(node)}.to_h
  end

  def journey
    current_node = "AAA"

    while current_node != "ZZZ" do
      choices = network[current_node]
      current_node = next_direction == :left ? choices.first : choices.last
      @steps += 1
    end

    return self
  end

  def next_direction
    directions[steps]
  end

  private

  attr_reader :input, :directions_input, :network_input

  def parse_node(node)
    key, left, right = node.scan(/(\w*) = \((\w*), (\w*)\)/).flatten
    [key, [left, right]]
  end
end

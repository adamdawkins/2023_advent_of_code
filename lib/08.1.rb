class Wasteland
  attr_reader :steps
  def initialize(input)
    @input = input
    @directions_input = @input.first
    @network_input = @input[2..]
    @steps = 0
    @current_node = "AAA"
  end

  def directions
    directions_input.chars.map {|c| c == "R" ? :right : :left }
  end

  def network
    network_input.map {|node| parse_node(node)}.to_h
  end

  def journey
    take_step while still_travelling?

    return self # to allow `wasteland.journey.steps`
  end

  private

  attr_reader :input, :directions_input, :network_input, :current_node

  def parse_node(node)
    key, left, right = node.scan(/(\w*) = \((\w*), (\w*)\)/).flatten
    [key, [left, right]]
  end

  def next_left?
    directions[steps] == :left
  end

  def still_travelling?
    current_node != "ZZZ"
  end

  def next_node
    choices = network[current_node]
    next_left?? choices.first : choices.last
  end
  
  def take_step
    @current_node = next_node
    @steps += 1
  end
end

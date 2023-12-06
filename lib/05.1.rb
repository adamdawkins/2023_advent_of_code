class Map
  def initialize(input)
    @input = input
    @transformation_input = @input[1..]
  end

  def name
    input.first.match(/([\w|-]*) map:/)[1]
  end

  def transform(number)
    change = transformations.select {|t| t[:min] <= number && t[:max] >= number }.sum {|t| t[:change] } || 0
    number + change
  end

  private

  attr_reader :input, :transformation_input

  def transformations
    transformation_input.map {|row| row_to_transformation(row) }
  end

  def row_to_transformation(row)
    destination_start, source_start, range =  row.scan(/\d+/).map(&:to_i)
    min = source_start
    max = source_start + range - 1
    change = destination_start - source_start
    { min:, max:, change:}

  end
end

class Almanac
  def initialize(input)
    @input = input
  end

  def seeds
    input.first.scan(/\d+/).map(&:to_i)
  end

  def maps 
     input[1..].chunk {|x| x.empty? }
               .reject {|divider, _| divider}
               .map(&:last)
               .map {| map_input| Map.new(map_input) }
  end

  private

  attr_reader :input
end

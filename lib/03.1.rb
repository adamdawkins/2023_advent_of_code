class Number
  attr_reader :value, :y, :min_x, :max_x
  def initialize(value:, y:, xs:)
    @value = value
    @y = y
    @min_x, @max_x = xs
  end

  def coordinates
    [[y, min_x], [y, max_x]]
  end

  def adjacent_coordinates
    result = []
    ys = [y - 1,
          y,
          y + 1]
    xs = ((min_x - 1)..(max_x + 1)).to_a
    
    ys.each do |y|
      xs.each do |x|
        result << [y, x]
      end
    end

    result - coordinates
  end
end

class EngineSchematic
  attr_reader :input

  def initialize(input)
    @input = input
  end

  def numbers
    result = []
    input.each do |row|
      result << row.scan(/\d+/)
    end
    result.flatten.compact.map(&:to_i)
  end


  def sum; end
end
